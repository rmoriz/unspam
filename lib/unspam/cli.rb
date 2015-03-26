require 'thor'
require 'json'
require 'httparty'
require 'ipaddr'

module Unspam
  class CLI < Thor
    map 'NETS' => :nets
    map 'ripe' => :nets
    map 'RIPE' => :nets

    desc 'nets ASN/IP [MESSAGE]', 'ASN or IP address. MESSAGE is optional'
    def nets(asn_or_ip, msg = nil)
      @msg = msg

      if asn_or_ip =~ /^AS|^[^\.]$/
        lookup_by_asn(asn_or_ip)
      else
        lookup_by_ip(asn_or_ip)
      end
    end

    no_commands do
      def lookup_by_ip(ip)
        response = HTTParty.get "https://stat.ripe.net/data/searchcomplete/data.json?resource=#{ip}"
        result = JSON.parse(response.body)

        as = []

        result['data']['categories'].each do |cat|
          as += cat['suggestions'].map { |s| s['value'] }
        end

        as.select { |v| v =~ /^AS/ }.each do |asn|
          lookup_by_asn(asn)
        end
      end

      def lookup_by_asn(asn)
        response = HTTParty.get "https://stat.ripe.net/data/announced-prefixes/data.json?resource=#{asn}&min_peers_seeing=2"
        result = JSON.parse(response.body)

        result['data']['prefixes'].map { |h| h['prefix'] }.sort.each do |prefix|
          printf("%-25s%5s\n", prefix, @msg)
        end
      end
    end
  end
end

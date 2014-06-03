require 'thor'
require 'json'
require 'httparty'

module Unspam
  class CLI < Thor
    desc "ripe ASN MSG", "bla"

    def ripe(asn, msg = nil)
      response = HTTParty.get "https://stat.ripe.net/data/announced-prefixes/data.json?resource=#{asn}&min_peers_seeing=1"

      result = JSON.parse(response.body)

      result['data']['prefixes'].map{ |h| h['prefix']}.sort.each do |prefix|
        printf("%-25s%5s\n", prefix, msg)
      end

    end
  end
end

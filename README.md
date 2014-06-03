# Unspam

Ultra simple tool to create postfix-compatible IP-blocklists based on AS-Numbers or IP-addresses. This is a very brutal way and should be limited to known spam providers.

## Installation

    $ gem install unspam

## Usage/Example

So you received another "Casino"-spam from e.g.

```
Received: from ab19c8d9.dutxng.net (171.25.200.217.static.clcksthrough.com [171.25.200.217]) by …
```

After some research you come to the conclusion, that the ISP behind 171.25.200.217 looks like a spam hoster that sent you spam mails for years and don't react on abuse notifications. It's time to let it go!


```shell
unspam nets 171.25.200.217 REJECT
171.25.200.0/23          REJECT
178.20.96.0/21           REJECT
185.51.232.0/22          REJECT
185.57.88.0/22           REJECT
188.64.40.0/22           REJECT
188.64.44.0/23           REJECT
188.64.46.0/23           REJECT
193.104.98.0/24          REJECT
193.105.250.0/24         REJECT
193.22.255.0/24          REJECT
193.25.114.0/23          REJECT
195.130.215.0/24         REJECT
195.225.148.0/22         REJECT
195.5.120.0/23           REJECT
195.82.152.0/23          REJECT
2a00:5300:0:1::/64       REJECT
2a00:5300:0:2::/64       REJECT
2a00:5300:0:3::/64       REJECT
2a00:5300::/32           REJECT
2a00:fa40::/32           REJECT
5.44.100.0/22            REJECT
5.44.108.0/22            REJECT
5.44.96.0/22             REJECT
81.88.16.0/21            REJECT
81.88.24.0/22            REJECT
81.88.28.0/22            REJECT
89.22.96.0/19            REJECT
91.203.128.0/22          REJECT
91.203.212.0/22          REJECT
91.206.142.0/23          REJECT
91.207.94.0/23           REJECT
91.226.88.0/22           REJECT
91.227.246.0/23          REJECT
91.235.208.0/22          REJECT
```

All announed prefixes of that spam ISP will be looked up using the RIPE.net looking glass. Your optional message will apprear behind the net so you can easily paste/add this to your postfix client_checks file.

You can use an IP-Address or AS-number to lookup the result.

e.g.

```shell
unspam net AS31342
```

will produce the identical result.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/unspam/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

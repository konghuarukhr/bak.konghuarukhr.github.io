dnscrypt-wrapper --resolver-address=8.8.8.8:53 --listen-address=0.0.0.0:443 \
                   --provider-name=2.dnscrypt-cert.darkstar \
                   --crypt-secretkey-file=1.key --provider-cert-file=1.cert


dnscrypt-proxy --local-address=127.0.0.1:53 --resolver-address=47.52.88.28:443 \
                 --provider-name=2.dnscrypt-cert.darkstar \
                 --provider-key=22A5:78D4:3A82:6561:880B:6D88:A6DC:F2D9:73DC:EE78:9489:EBF1:75CB:DB74:0D8E:397D

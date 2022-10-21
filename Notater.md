### Manager

ssh root@10.212.140.163 -i {KEY}.pem

r10k deploy environment testing -pv

### Server1

ssh root@10.212.136.133 -i {KEY}.pem

sudo -i
puppet agent -t
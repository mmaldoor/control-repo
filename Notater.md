### Manager

ssh root@10.212.140.163 -i {KEY}.pem

r10k deploy environment testing -pv

### Server1

ssh root@10.212.136.133 -i {KEY}.pem

sudo -i
puppet agent -t


## Snort config 

    vim /etc/snort/snort.conf

 **linje 51**  

    ipvar HOME_NET 192.168.180.0/24  #ip adress tatt fra ip addr

**Installing rules**

    wget https://www.snort.org/rules/snortrules-snapshot-2983.tar.gz?oinkcode=edbd39c3beb231a12ecf24e55ac03d873878bab4 -O snortrules-snapshot-2983.tar.gz

    sudo tar -xvzf snortrules-snapshot-2983.tar.gc -C /etc/snort/rules


**Turn promisc on** 

    sudo ip link set ens3 promisc on

**start snort**

    sudo snort -d -l /var/log/snort/ -h 192.168.180.0/24 -A console -c /etc/snort/snort.conf



# modules used

puppet module install puppet-archive --version 6.0.2


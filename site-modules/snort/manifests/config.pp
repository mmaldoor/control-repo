# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort::config
class snort::config (
  $ip_range = '192.168.180.0/24',
) {
  $snort_conf_hash = {
    'ip_range' => $ip_range
  }

  file { '/etc/snort/snort.conf':
    content => epp('snort/snort_conf.yaml.epp', $snort_conf_hash),
    notify  => Service['snort'],
  }

  exec { 'Promisc mode':
    command => 'ip link set ens3 promisc on',
    path    => '/usr/local/bin/:/bin/',
    unless  => 'netstat -i | grep ens3 | grep P',
  }

  ##discord

  file { '/usr/local/bin/discord':
    ensure => present,
    source => 'puppet:///modules/snort/discord.sh',
    mode   => '0744',
  }

# Class: name
#
#

  archive { '/tmp/snortrules-snapshot-2983.tar.gz':
    ensure        => present,
    extract       => true,
    extract_path  => '/etc/snort/rules',
    source        => 'https://www.snort.org/rules/snortrules-snapshot-2983.tar.gz?oinkcode=edbd39c3beb231a12ecf24e55ac03d873878bab4',
    creates       => '/tmp/snortrules.tar.gz',
    cleanup       => false,
    notify        => Service['snort'],
  }

  file { '/etc/systemd/system/snort.service':
    source => 'puppet:///modules/snort/snort.service',
    notify => Service['snort'],
  }

  service { 'snort':
    ensure  => running,
    enable  => true,
    require => File['/etc/snort/snort.conf'],
  }
}

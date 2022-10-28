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
    content => epp('snort/snort_conf.yaml.epp', $snort_conf_hash)
  }
}

# Class: name
#
#
class { 'archive':
}

archive { '/tmp/snortrules-snapshot-2983.tar.gz':
  ensure        => present,
  extract       => true,
  extract_path  => '/etc/snort/rules',
  checksum      => 'd0431bd39e082f8c1acd5c5c6df41980',
  checksum_type => 'md5',
  source        => 'https://www.snort.org/rules/snortrules-snapshot-2983.tar.gz?oinkcode=edbd39c3beb231a12ecf24e55ac03d873878bab4',
}

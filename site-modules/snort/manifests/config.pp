# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort::config
class snort::config (
  $ip_range = '192.168.180.0/24',
){

  $snort_conf_hash = {
    'ip_range' => $ip_range
  }

  file { '/etc/snort/snort.conf':
    content => epp('snort/snort_conf.yaml.epp', $snort_conf_hash)
  }


#   archive { '/tmp/snortrules-snapshot-2983.tar.gz':
#   ensure        => present,
#   extract       => true,
#   extract_path  => '/etc/snort/rules',
#   source        => 'https://www.snort.org/rules/snortrules-snapshot-2983.tar.gz?oinkcode=edbd39c3beb231a12ecf24e55ac03d873878bab4',
#   cleanup       => true,
# }

class { 'archive':
  archives => { '/tmp/snortrules-snapshot-2983.tar.gz' => {
                  ensure        => present,
                  extract       => true,
                  extract_path  => '/etc/snort/rules',
                  source        => 'https://www.snort.org/rules/snortrules-snapshot-2983.tar.gz?oinkcode=edbd39c3beb231a12ecf24e55ac03d873878bab4',
                  cleanup       => true,
                  }, }


}

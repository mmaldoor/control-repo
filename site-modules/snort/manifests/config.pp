# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort::config
class snort::config (
  $ip_range,
){

  $snort_conf_hash = {
    'ip_range' => $ip_range
  }

  file { '/etc/snort/snort.conf':
    content => epp('snort/snort_conf.yaml.epp', $snort_conf_hash)
  }
}

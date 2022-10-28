# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort
class snort (
  $ip_range,
) {
  contain snort::install
  class { 'snort::config':
    ip_range => $ip_range
  }
}

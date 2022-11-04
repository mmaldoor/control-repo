# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort
class snort (
  $ip_range,
  $interface,
) {
  contain snort::install
  contain snort::config
}

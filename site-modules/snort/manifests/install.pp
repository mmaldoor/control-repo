# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort::install
class snort::install {
  package { 'snort':
    ensure => present,
  }

  Archive {
    ensure   => 'present',
    provider => 'wget',
  }
}

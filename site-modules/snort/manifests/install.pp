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
  # if $facts['osfamily'] != 'windows' {
  #   package { 'wget':
  #     ensure => present,
  #   }

  #   package { 'bunzip':
  #     ensure => present,
  #   }

  #   Archive {
  #     provider => 'wget',
  #     require  => Package['wget', 'bunzip'],
  #   }
  # }

  Archive {
    ensure   => 'present',
    provider => 'wget',
  }
}

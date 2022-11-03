# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include snort::install
class snort::install {
  package { 
    'libdumbnet-dev':
      ensure => installed;
    'build-essential':
      ensure => installed;
    'tcpdump':
      ensure => installed;
    'libdaq-dev':
      ensure => installed;
  }

  package { 'snort':
    ensure          => 'present',
    install_options => ['-override', '"', 'ens3', '192.168.180.0/24', 'ens3', '"'],
  }
}

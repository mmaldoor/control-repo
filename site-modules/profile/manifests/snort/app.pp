#Men for fææn
class profile::snort::app {
  class { 'snort':
    ip_range  => lookup('profile::snort::app::ip_range'),
    interface => lookup('profile::snort::app::interface')
  }
}

# The role for snort profiles
class role::snort_app {
  include profile::snort::app
  include profile::snort::motd
}

class role::pasture_app {
  include profile::base::gem
  include profile::pasture::app
  include profile::base::motd
}

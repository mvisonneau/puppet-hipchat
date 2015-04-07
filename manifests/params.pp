# Class: hipchat::params
#
# Parameterize for Puppet platform.
#
class hipchat::params {
  $token            = undef
  $room             = undef
  $notify           = false
  $notify_color     = 'red'
  $failed_color     = 'red'
  $successful_color = 'green'
  $unchanged_color  = 'gray'
  $statuses         = ['failed']
  $package_name     = 'hipchat'
  $install_hc_gem   = true
  $puppetboard      = false
  $dashboard        = false
  $proxy            = undef

  if str2bool($::is_pe) {
    $puppetconf_path = '/etc/puppetlabs/puppet'
    $provider        = 'pe_gem'
    $owner           = 'pe-puppet'
    $group           = 'pe-puppet'
    $config_file     = "${puppetconf_path}/hipchat.yaml"
  } else {
    $puppetconf_path = '/etc/puppet'
    $provider        = 'gem'
    $owner           = 'puppet'
    $group           = 'puppet'
    $config_file     = "${puppetconf_path}/hipchat.yaml"
  }
}
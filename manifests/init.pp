# Class: hipchat
#
# Send Puppet report information to HipChat
#
class hipchat (
  $token            = $hipchat::params::token,
  $room             = $hipchat::params::room,
  $notify_room      = $hipchat::params::notify_room,
  $notify_color     = $hipchat::params::notify_color,
  $failed_color     = $hipchat::params::failed_color,
  $successful_color = $hipchat::params::successful_color,
  $unchanged_color  = $hipchat::params::unchanged_color,
  $statuses         = $hipchat::params::statuses,
  $puppetconf_path  = $hipchat::params::puppetconf_path,
  $package_name     = $hipchat::params::package_name,
  $install_hc_gem   = $hipchat::params::install_hc_gem,
  $provider         = $hipchat::params::provider,
  $owner            = $hipchat::params::owner,
  $group            = $hipchat::params::group,
  $puppetboard      = $hipchat::params::puppetboard,
  $dashboard        = $hipchat::params::dashboard,
  $proxy            = $hipchat::params::proxy,
  $config_file      = undef,
) {

  validate_string($token)
  validate_string($room)
  if ! defined( $config_file ) {
    $config_file = "${puppetconf_path}/hipchat.yaml"
  }

  file { $config_file:
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => '0440',
    content => template('hipchat/hipchat.yaml.erb'),
  }

  if $install_hc_gem {
    if !defined( Package[$package_name]) {
      package { $package_name:
        ensure   => installed,
        provider => $provider,
      }
    }
  }
}

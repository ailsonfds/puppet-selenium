# == Class: selenium::params
#
# This class should be considered private.
#
#
class selenium::params {
  $display          = ':0'
  $user             = 'selenium'
  $manage_user      = true
  $group            = $user
  $manage_group     = true
  $install_root     = '/opt/selenium'
  $server_options   = ''
  $server_d_opts   = '-Dwebdriver.enable.native.events=1'
  $hub_options      = '-role hub'
  $node_options     = "${server_options} -role node"
  $java             = 'java'
  $version          = '3.141.59'
  $default_hub      = 'http://localhost:4444/grid/register'
  $download_timeout = '90'

  case $::osfamily {
    'redhat': {
      $service_template = 'redhat.selenium.erb'
    }
    'debian': {
      $service_template = 'debian.selenium.erb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

}

# == Class: selenium::node
#
# Please refer to https://github.com/jhoblitt/puppet-selenium#seleniumnode for
# parameter documentation.
#
#
class selenium::node(
  $display = $selenium::params::display,
  $options = $selenium::params::node_options,
  $d_opts  = $selenium::params::d_opts,
  $hub     = $selenium::params::default_hub,
) inherits selenium::params {
  validate_string($display)
  validate_string($options)
  validate_string($d_opts)
  validate_string($hub)

  include selenium

  $safe_options = "${options} -hub ${hub}"

  anchor { 'selenium::node::begin': }
  -> Class[ 'selenium' ]
  -> selenium::config{ 'node':
    display      => $display,
    user         => $selenium::user,
    group        => $selenium::group,
    install_root => $selenium::install_root,
    options      => $safe_options,
    d_opts       => $d_opts,
    java         => $selenium::java,
  }
  -> anchor { 'selenium::node::end': }
}

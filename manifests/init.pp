# == Class: tinc
#
# Full description of class tinc here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class tinc (
  $ip_address,
  $network_name = $tinc::params::network_name,
  $package_name = $tinc::params::package_name,
  $hosts_dir    = $tinc::params::hosts_dir,
) inherits tinc::params {

  if $::osfamily == 'Archlinux' {
    $service_name = "${tinc::params::service_name}@${network_name}"
  }

  # validate parameters here
  validate_string($package_name, $ip_address)

  class { 'tinc::install': } ->
  class { 'tinc::config': } ~>
  class { 'tinc::service': } ->
  Class['tinc']
}

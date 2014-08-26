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
  $ip_adress,
  $network_name = $tinc::params::network_name,
  $package_name = $tinc::params::package_name,
  $service_name = $tinc::params::service_name,
  $hosts_dir    = $tinc::params::hosts_dir,
  $port         = $tinc::params::port,
) inherits tinc::params {

  if $::osfamiliy == 'Archlinux' {
    $service_name = "${service_name}@${network_name}"
  }

  # validate parameters here
  validate_string($package_name, $ip_adress, $port)

  class { 'tinc::install': } ->
  class { 'tinc::config': } ~>
  class { 'tinc::service': } ->
  Class['tinc']
}
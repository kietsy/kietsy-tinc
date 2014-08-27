# == Class tinc::params
#
# This class is meant to be called from tinc
# It sets variables according to platform
#
class tinc::params {
  $hosts_dir    = 'puppet:///modules/tinc/sample-config/hosts'
  $network_name = 'sample'
  $connect_to   = ['alpha', 'beta']

  case $::osfamily {
    'Debian': {
      $package_name = 'tinc'
      $service_name = 'tinc'
    }
    'RedHat', 'Amazon': {
      $package_name = 'tinc'
      $service_name = 'tinc'
    }
    'Archlinux': {
      $package_name = 'tinc'
      $service_name = 'tincd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

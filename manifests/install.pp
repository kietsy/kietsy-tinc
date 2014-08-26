# == Class tinc::install
#
class tinc::install {

  package { $tinc::package_name:
    ensure => present,
  }
}

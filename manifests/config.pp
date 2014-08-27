# == Class tinc::config
#
# This class is called from tinc
#
class tinc::config {
  $network_name = $tinc::network_name
  $ip_address   = $tinc::ip_address
  $hosts_dir    = $tinc::hosts_dir
  $service_name = $tinc::service_name
  $connect_to   = $tinc::connect_to
  $package_name = $tinc::package_name

  file { "/etc/tinc/${network_name}/hosts":
    ensure  => directory,
    source  => $hosts_dir,
    group   => root,
    owner   => root,
    recurse => true,
    notify  => Service[$service_name],
    require => Package[$package_name],
  }

  file { "/etc/tinc/${network_name}/tinc-up":
    ensure  => file,
    content => template('tinc/tinc-up.erb'),
    mode    => '0755',
    group   => root,
    owner   => root,
    notify  => Service[$service_name],
  }

  file { "/etc/tinc/${network_name}/tinc-down":
    ensure  => file,
    content => template('tinc/tinc-down.erb'),
    mode    => '0755',
    group   => root,
    owner   => root,
    notify  => Service[$service_name],
  }

  file { "/etc/tinc/${network_name}/tinc.conf":
    ensure  => file,
    content => template('tinc/tinc.conf.erb'),
    mode    => '0655',
    group   => root,
    owner   => root,
    notify  => Service[$service_name],
  }
}

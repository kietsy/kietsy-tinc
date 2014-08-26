# == Class tinc::config
#
# This class is called from tinc
#
class tinc::config {
  $network_name = $tinc::network_name
  $port         = $tinc::port
  $ip_address   = $tinc::ip_address
  $hosts_dir    = $tinc::hosts_dir

  file { "/etc/tinc/${network_name}/hosts":
    ensure  => directory,
    source  => $hosts_dir,
    group   => root,
    owner   => root,
    recurse => true,
    notify  => Service['tincd@home'],
    require => Package['tinc'],
  }

  file { "/etc/tinc/${network_name}/tinc-up":
    ensure  => file,
    content => template('tinc/tinc-up.erb'),
    mode    => '0755',
    group   => root,
    owner   => root,
    notify  => Service['tincd@home'],
  }

  file { "/etc/tinc/${network_name}/tinc-down":
    ensure  => file,
    content => template('tinc/tinc-down.erb'),
    mode    => '0755',
    group   => root,
    owner   => root,
    notify  => Service['tincd@home'],
  }

  file { "/etc/tinc/${network_name}/tinc.conf":
    ensure  => file,
    content => template('tinc/tinc-up.erb'),
    mode    => '0755',
    group   => root,
    owner   => root,
    notify  => Service['tincd@home'],
  }
}

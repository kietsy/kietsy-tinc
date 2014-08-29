# == Class tinc::service
#
# This class is meant to be called from tinc
# It ensure the service is running
#
class tinc::service {

  case $::osfamily {
    'Debian': {
      service { $tinc::service_name:
        ensure     => running,
        enable     => true,
        hasstatus  => false,
        hasrestart => true,
      }
    }
    'Archlinux': {
      service { $tinc::service_name:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
      }
    }
    default: {
      fail("${::operatingsystem} not supported. Pull Requests welcome.")
    }
  }

}

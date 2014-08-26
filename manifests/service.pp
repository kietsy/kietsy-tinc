# == Class tinc::service
#
# This class is meant to be called from tinc
# It ensure the service is running
#
class tinc::service {

  service { $tinc::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

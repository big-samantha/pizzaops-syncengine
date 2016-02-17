# == Class syncengine::service
#
# This class is meant to be called from syncengine.
# It ensure the service is running.
#
class syncengine::service {

  service { $::syncengine::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

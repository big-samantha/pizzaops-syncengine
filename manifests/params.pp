# == Class syncengine::params
#
# This class is meant to be called from syncengine.
# It sets variables according to platform.
#
class syncengine::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'syncengine'
      $service_name = 'syncengine'
    }
    'RedHat', 'Amazon': {
      $package_name = 'syncengine'
      $service_name = 'syncengine'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

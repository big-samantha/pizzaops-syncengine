# == Class syncengine::install
#
# This class is called from syncengine for install.
#
class syncengine::install {

  package { $::syncengine::package_name:
    ensure => present,
  }
}

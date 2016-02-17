# Class: syncengine
# ===========================
#
# Full description of class syncengine here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class syncengine (
  $package_name = $::syncengine::params::package_name,
  $service_name = $::syncengine::params::service_name,
) inherits ::syncengine::params {

  # validate parameters here

  class { '::syncengine::install': } ->
  class { '::syncengine::config': } ~>
  class { '::syncengine::service': } ->
  Class['::syncengine']
}

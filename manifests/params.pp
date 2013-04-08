# == Class: ganglia::params
#
# provides parameters for the ganglia module
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::params {
  $gmond_package_name   = 'ganglia-gmond'
  $gmond_service_name   = 'gmond'

  $gmetad_package_name  = 'ganglia-gmetad'
  $gmetad_service_name  = 'gmetad'

  # paths are the same for el5.x & el6.x
  $web_package_name     = 'ganglia-web'
  $web_php_config       = '/etc/ganglia/conf.php'
  $web_php_erb          = 'ganglia/conf.php.el6.erb'

  case $::osfamily {
    redhat: {
      case $::lsbmajdistrelease {
        5,6, default: {
          $gmond_service_config = '/etc/ganglia/gmond.conf'
          $gmond_service_erb    = 'ganglia/gmond.conf.el6.erb'

          $gmetad_service_config = '/etc/ganglia/gmetad.conf'
          $gmetad_service_erb    = 'ganglia/gmetad.conf.el6.erb'
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

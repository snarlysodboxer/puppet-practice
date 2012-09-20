package {'nginx':
  ensure  => present,
}

package {'git':
  ensure  => present,
}

file {'/var/www':
  ensure  => directory,
}

exec {'git clone https://github.com/puppetlabs/exercise-webpage':
  cwd     => '/var/www',
  creates => '/var/www/exercise-webpage/index.html',
  path    => '/usr/bin',
}

service {'nginx':
  ensure  => running,
  enable  => true,
  hasrestart  => true,
}

file {'/etc/nginx/sites-enabled/default':
  ensure  => absent,
}

file {'/etc/nginx/sites-enabled/puppet-example':
  ensure  => present,
  path    => '/etc/nginx/sites-enabled/puppet-example',
  source  => '/tmp/puppet-example',
  notify  => Service['nginx'],
}

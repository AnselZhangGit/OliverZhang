class oliver::passenger {
#  exec { 'key' :
#    command => "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7",
#    path => "/usr/bin/",
#  }

  file { 'repository' :
    path => "/etc/apt/sources.list.d/passenger.list",
    mode => 600,
    owner => root,
    ensure => present,
    content => "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main",
#    require => Exec['key'],
  }

  package { 'libapache2-mod-passenger' :
    ensure => installed,
  }

  exec { 'enablepassenge' :
    command => "cp -f /etc/apache2/mods-available/passenger.* /etc/apache2/mods-enabled/",
    path => "/bin/",
    require => Package["libapache2-mod-passenger"],
    notify => Service["apache2"],
  }

  bundler::install { '/home/oliver/simple-sinatra-app/' :
    user       => 'oliver',
    group      => 'oliver',
    deployment => true,
    require => Package["libapache2-mod-passenger"],
}
}

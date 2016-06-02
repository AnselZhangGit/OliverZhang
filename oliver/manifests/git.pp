class oliver::git {
  package { 'git':
    ensure => installed,
  }

  vcsrepo { "/home/${username}/simple-sinatra-app":
    ensure   => latest,
    owner    => $username,
    group    => $username,
    provider => git,
    require  => [ Package["git"] ],
    source   => "https://github.com/tnh/simple-sinatra-app.git",
    revision => 'master',
  }

  file { "/home/${username}/simple-sinatra-app/public" :
    ensure  => directory,
    group   => $username,
    owner   => $username,
    mode    => 0755,
    require  => [ Vcsrepo["/home/${username}/simple-sinatra-app"] ],
  }


  file { "/home/${username}/simple-sinatra-app/" :
    ensure  => directory,
    group   => $username,
    owner   => $username,
    mode    => 0777,
    require  => [ Vcsrepo["/home/${username}/simple-sinatra-app"] ],
  }
}


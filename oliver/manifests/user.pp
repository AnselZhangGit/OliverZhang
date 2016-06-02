class oliver::user {
  $group = $username

  group { $group:
    ensure  => present,
    gid     => 2000,
  }

  user { $username:
    ensure  => present,
    gid     => $group,
    require => Group[$group],
    uid     => 2000,
    home    => "/home/${username}",
    shell   => "/bin/bash",
    managehome  => true,
  }
}

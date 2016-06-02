class oliver::ruby {
  package { 'ruby' :
    ensure => installed,
  }

  package { 'bundler' :
    ensure => installed,
  }
}


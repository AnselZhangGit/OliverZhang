class oliver::apache {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2' :
    ensure => 'running',
    require => Package["apache2"],
  }

  $str = "
<VirtualHost *:80>
    ServerName oliver.com

    ServerAdmin oliver@localhost
    DocumentRoot /home/oliver/simple-sinatra-app/public

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory \"/home/oliver/simple-sinatra-app/public\">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>"

  file {'oliver' :
    path => "/etc/apache2/sites-available/oliver.conf",
    content => $str,    
    require => Package["apache2"],
  }

  file {'000-default' :
    path => "/etc/apache2/sites-enabled/000-default.conf",
    ensure => absent,    
    require => Package["apache2"],
  }

  file {'oliver.conf' :
    path => "/etc/apache2/sites-enabled/oliver.conf",
    content => $str,    
    ensure => present,
    require => Package["apache2"],
  }
}

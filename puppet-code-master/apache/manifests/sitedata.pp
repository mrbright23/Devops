class apache::sitedata inherits apache::main {

  file { '/var/www/html/index.html':
    ensure => file,
    source => 'puppet:///modules/apache/index.html',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

}

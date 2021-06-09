class apache::service inherits apache::main {

  service{ 'apache2':
    ensure   => running,
    enable  => true,
    require  => Package['apache2']
  }

}

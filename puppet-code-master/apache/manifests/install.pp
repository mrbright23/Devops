class apache::install inherits apache::main {

  package{ 'apache2':
    ensure => installed,
  }

}

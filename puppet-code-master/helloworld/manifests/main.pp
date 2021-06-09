# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include helloworld::main
class helloworld::main {

$username = 'jenkins'
$group = 'jenkinsadm'

file { '/opt/hello.txt':
  ensure  => file,
  content => "hello, puppet\n",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

group { $group:
  ensure => 'present',
  gid    => '2000',
}

user { $username:
  ensure => present,
  uid    => '2000',
  gid    => '2000',
  shell  => '/bin/bash',
  home   => '/home/jenkins',
}

file { '/opt/jenkins_logs':
  ensure => directory,
  mode   => '0644',
  owner  => $username,
  group  => $group 
}

cron {'log-rotation':
  user    => 'jenkins',
  command => '/opt/logrotaion.sh',
  hour    => '00',
  minute  => '30',
  weekday => ['Saturday', 'Sunday']
}

package { 'unzip':
  ensure => 'installed'
}

$packages = ['wget', 'curl', 'git']

package { $packages:
  ensure => installed
}

package { 'haproxy':
  ensure => installed,
}

service { 'haproxy':
  ensure  => running,
  require => Package['haproxy']
}


file {'/opt/sample.txt':
  ensure => file,
  mode   => '0644',
  source => 'puppet:///modules/helloworld/sample.txt',
  notify => Service['sshd']
}

service { 'sshd':
  ensure => running,
  enable => true
}

}

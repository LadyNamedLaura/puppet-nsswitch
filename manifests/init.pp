# == Class: nsswitch
#
class nsswitch {
  concat { '/etc/nsswitch.conf':
    ensure => present,
  }

  concat::fragment {
    "nsswitch.conf_header":
      target  => '/etc/nsswitch.conf',
      content => "# MANAGED BY PUPPET!! DO NOT EDIT\n\n",
      order   => "0_header",
    ;
    "nsswitch.conf_footer":
      target  => '/etc/nsswitch.conf',
      content => "\n\n# End of /etc/nsswitch.conf\n",
      order   => "9_footer",
  }

  #these should be the glibc defaults
  $defaults = {
    passwd    => 'files',
    group     => 'files',
    shadow    => 'files',
    networks  => 'files',
    protocols => 'files',
    services  => 'files',
    ethers    => 'files',
    rpc       => 'files',
    netgroup  => 'files',
  }
  $defaults.each |$db, $value| {
    nsswitch::entry {"default for ${db}":
      database => $db,
      value    => $value,
    }
  }
  nsswitch::entry {
    "default for hosts: files":
      database => 'hosts',
      value    => 'files',
      order    => '40',
    ;
    "default for hosts: dns":
      database => 'hosts',
      value    => 'dns',
      order    => '50',
  }
}

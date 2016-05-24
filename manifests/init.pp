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
      content => "\n\n",
      order   => "9_footer",
  }
}

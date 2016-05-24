# == Define: nsswitch::database
#
define nsswitch::database () {
  include ::nsswitch
  concat::fragment {"nsswitch.conf_db_${name}":
      target  => '/etc/nsswitch.conf',
      content => "\n${name}",
      order   => "5_${name}+",
  }
}

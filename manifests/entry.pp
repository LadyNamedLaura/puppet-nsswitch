# == Define: nsswitch::entry
#
define nsswitch::entry (
  $database,
  $value,
  $order = "50",
) {
  ensure_resource('nsswitch::database', $database)
  concat::fragment {"nsswitch.conf_db_${database}":
      target  => '/etc/nsswitch.conf',
      content => "\t${value}",
      order   => "5_${database}_${order}_${value}",
  }
}

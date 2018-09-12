class facts_test (
  $hiera_ipaddress,
  $facts_ipaddress = $::ipaddress,
) {
  file {'/tmp/hiera_ipaddress':
    ensure  => file,
    content => $hiera_ipaddress,
  }
  file {'/tmp/facts_ipaddress':
    ensure  => file,
    content => $facts_ipaddress,
  }
  file {'/tmp/ipaddress':
    ensure  => file,
    content => $::ipaddress,
  }
}

class thinkpad-power {
  package {"acpi": ensure => "installed"}
  package {"acpi-support": ensure => "installed"}
  package {"pm-utils": ensure => "installed"}
  augeas {"acpi-defaults":
    context => "/files/etc/default/acpi-support",
    changes => ["set LID_SLEEP true"],
    #onlyif => "match LID_SLEEP[. != 'true']"
  }
}

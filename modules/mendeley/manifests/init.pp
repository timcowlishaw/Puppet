class mendeley {
  apt::source {'mendeleydesktop':
    location => "http://www.mendeley.com/repositories/ubuntu/stable",
    include_src => false,
    release => "/",
    repos => "",
    key => "mendeleydesktop",
    key_content => "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.10 (GNU/Linux)

mQENBE1iqbIBCAC9JMUxlRw3jxtm9eTTiqQZPVg4JqCmayeSrnYn5kbAdWMWNEzN
sbR2oevbAOxzwW9SSiUt44b+FRLIYWsx2AASRPVMdgc/1rCwgZ52E0XWPY7w0iwa
76QQkb1tID5Sji5+nXviOWwx+lIXjFV2MeVpy+J9N/GQgJxifh47QXot/yLfP3bL
jEmHvhtRxnPeCrhmcLNMDDjuR4W0L1luoQsM4YamnxF209Gt73FV4jr4u0ENBDO8
bbcD4Eh446yqUi/BYo21HMFdR/LwitiCKGjK36FwEYbbomNXnvsZdn6b4V8qlsjD
2eN2M/S77+cxlAAzrx/HMUGf6aIefKqJxsSJABEBAAG0LE1lbmRlbGV5IERlc2t0
b3AgVGVhbSA8ZGVza3RvcEBtZW5kZWxleS5jb20+iQE4BBMBAgAiBQJNYqmyAhsD
BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDYAMfWbwNgRINVB/0TVN0M4d9X
Rz+rxhpNjn3ATAmyja65RDqmjEkdMZHKY23hPGvC3hTvDq2qQsO09oyB9DAZTD2U
iFHDe1nN1KTjD5JdGZNoz9eYyMKwSayRT19u3vt5WePcrg9EOTz2LUd/vw8Rj3ts
QvWP4EnGaA6fOLFtwoYYLy6WSC02eNHQcjF2PVS+BvU7sYjTed4EAIvy6PI8BSAQ
+QHXXY3yOeOsl5RiS1fXQ+3td+z4KroiHuhLWaX7C7NB6Tqw//TpOr5hFmGxNQt4
BgzebWda9ksf5OrFmqdNnJAZfmNcbAAfvnP+6SPn3l+/Q57lAox/Z9RU+u79+/ha
7smAiKu1SCQ/uQENBE1iqbIBCADccjeTvKyoG4g8pO0dNf+sRFK9tUoJOGtSSNXC
PDZyuub/NmmhHJ0INA1EifdFxHFubxZAlh7oo/StoQ1yGyOMPxJqMIn9kJ0qqRFD
OkVq+bNDrJt5NOBgg+epqs/ug2AnWSBvOiEdXmHY7qbhjXYQ6Q/IhgyIb3whmFaY
9JTTd/4DyqCwNsVKoJUoHOVv37Zy4XNfU00Va87NuXXGd9Ks4LPcPYsrkm+5KxkO
PAPYsNgPiSXuDviqY2bEFGZuQ09VnsJXYa/LLd2OgR82SXxAJUeBld8jXx7VC6dZ
3An37W/8EgI9lcYQYilwoZP9NUgPHDB/lGURJJ0rqESGgh/pABEBAAGJAR8EGAEC
AAkFAk1iqbICGwwACgkQ2ADH1m8DYETEFggArKSXw335POvd8vWTwT93iZGx5IsL
p1/M05xnoCdDxvpnTUxQdRZ+1Wqjmbie1usqlRO7fqRVl64qSU95Rwz38pTP39+w
Drtcesg2+wYoPzKQuXyc5NtYOE8+IvOUoLj0tKbOfOifB8ThbylViEJo/UCYea1e
1NyOULX3Ls3w0P5GmZviRa79QXwcCnszq1n7sdMqZCo90HqKDznVvE52PRAeMx8T
9+BRXfNyATDJIhp4mQKiW36R8POqB4MDG12VYOd//61zJoLyOLhXdTqzklYeNESk
9p55MNnf/7juAkhL5nGeSPSRsKHhV+kEMI47HBwQSPeasiNLCE6FaR1LOQ==
=9p9j
-----END PGP PUBLIC KEY BLOCK-----"
  }

  package {'mendeleydesktop':
    ensure => 'installed',
    require => Apt::Source['mendeleydesktop']
  }

  Class['x'] -> Class['mendeley']
}

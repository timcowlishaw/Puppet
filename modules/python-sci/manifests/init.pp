class python-sci {
  package {"gfortran": ensure => "installed"}
  package {"libblas-dev": ensure => "installed"}
  package {"libatlas-dev": ensure => "installed"}
  package {"liblapack-dev": ensure => "installed"}
  package {"libbtf1.1.0": ensure => "installed"}
  package {"libcamd2.2.0": ensure => "installed"}
  package {"libccolamd2.7.1": ensure => "installed"}
  package {"libcholmod1.7.1": ensure => "installed"}
  package {"libcsparse2.2.3": ensure => "installed"}
  package {"libcxsparse2.2.3": ensure => "installed"}
  package {"libklu1.1.0": ensure => "installed"}
  package {"libldl2.0.1": ensure => "installed"}
  package {"libsuitesparse-dev": ensure => "installed"}
  package {"swig": ensure => "installed"}
  package {"swig2.0": ensure => "installed"}
  package {"libpng-dev": ensure => "installed"}
  package {"python-gtk2-dev": ensure => "installed"}
  Class['base'] -> Class['python-sci']
  Class['python-dev'] -> Class['python-sci']
}

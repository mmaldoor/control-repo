class gem {
  package { 'ruby-dev':
    ensure => present,
  }

   package { 'libpq-dev':
    ensure => present,
  }

  package { 'gcc':
    ensure => present,
  }
  
  package { 'make':
    ensure => present,
  }

  package { 'g++':
    ensure => present,
  }
}

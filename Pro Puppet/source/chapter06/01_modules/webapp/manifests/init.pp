class webapp {
  include accounts::virtual
  # This is an example web application
  package { 'webapp': ensure => present }

  # Realize a specific virtual resource using the collection
  # Syntax.  This will select only user resoruces with a title
  # of 'mysql'.  There can only be one or zero of these resources.
  # The collection syntax may be used to configure relationships among
  # virtual resources and other resources.  This is not possible
  # with the realize() function
  User <| title == 'mysql' |> { before => Pacakge['webapp'] }
  # Alternatively, we can use the realize() function.
  # Unlike the collection syntax above, this function will fail
  # if the virtual resource is not declared.
  realize(User['mysql'])
}



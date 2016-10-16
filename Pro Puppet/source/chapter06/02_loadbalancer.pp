# All of the source code for the load balancer is contained in one Puppet
# Manifests for readability.  Typically, each defined resource type and class
# should be located inside of a module directory structure.

# This is the defined resource type we will export to other nodes.  A worker
# system's catalog will export this configuration resource into the database
# and a front end load balancer's catalog will collect these resources from the
# database.

define balancermember($url) {
  file { "/etc/httpd/conf.d.members/worker_${name}.conf":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => "  BalancerMember $url \n",
  }
}

# Back end worker nodes shoudl have the worker class in their catalog.
# When a puppet master compiles the catalog of a worker, it will export
# the balancermember resource to the database.
class worker {
  @@balancermember { "${fqdn}":
    url => "http://${fqdn}:18140",
  }
}

# Front end load balancer nodes should have the loadbalancer_members class in
# their catalog.  They will collect the balancermember resources exported by
# the workers.
class loadbalancer_members {
  Balancermember <<| |>> { notify => Service['apache'] }
}


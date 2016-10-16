class base {
  include sudo, ssh, puppet
}

node puppet.example.com {
  include base
  include puppet::master
}

node web.example.com {
  include base, apache

  apache::vhost { 'www.example.com':
    port => 80,
    docroot => '/var/www/www.example.com',
    ssl => false,
    priority => 10,
    serveraliases => 'home.example.com',
  }    
}

node db.example.com {
  include base, mysql
}

node mail.example.com {
  include base, postfix
}

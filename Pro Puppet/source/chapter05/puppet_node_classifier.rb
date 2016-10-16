#!/usr/bin/env ruby

require 'yaml'

node = ARGV[0]
default = { 'classes' => []}

unless node =~ /(^\S+)\.(\S+\.\S+)$/
  print default.to_yaml
end

hostname = $1

base = { 'environment' => 'production',
         'parameters' => {
                    'puppetserver' => 'puppet.example.com'
         },
         'classes' => [ 'base' ],
       }

case hostname
  when /^web?\w+$/
     web = { 'classes' => 'apache'  }
     base['classes'] << web['classes']
     puts YAML.dump(base)
  when /^db?\w+$/
     db = { 'classes' => 'mysql'  }
     base['classes'] << db['classes']
     puts YAML.dump(base)
  when /^mail?\w+$/
     mail = { 'classes' => 'postfix'  }
     base['classes'] << mail['classes']
     puts YAML.dump(base)
  else
    print default.to_yaml
end

exit 0

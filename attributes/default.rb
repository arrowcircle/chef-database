default['database']['server'] = true
default["database"]["password"] = ""

default["mysql"]["server_debian_password"] = node["database"]["password"]
default["mysql"]["server_root_password"] = node["database"]["root_password"]
default["mysql"]["server_repl_password"] = node["database"]["password"]

default["postgresql"]["password"]["postgres"] = node["database"]["root_password"]
default["postgresql"]["pg_hba"] = ["host    #{node['app_name'].gsub('-', '_')}_production     #{node['app_name'].gsub('-', '_')}        127.0.0.1/32            #{node['database']['password'].length > 1 ? 'md5' : 'trust'}"]
default["postgresql"]["initdb_options"] = "--locale=ru_RU.UTF-8"

default["database"]["username"] = node['app_name'].gsub('-', '_')
default["database"]["db_name"] = "#{node['app_name'].gsub('-', '_')}_production"

default["postgresql"]["users"] = [{
            "username" => node["database"]["username"],
            "password" => node["database"]["password"],
            "superuser" => false,
            "createdb" => true,
            "login" => true
          }]
default["postgresql"]["databases"] = [{
            "name" => node["database"]["db_name"],
            "owner" => node["database"]["username"],
            "template" => "template0",
            "encoding" => "utf8",
            "extensions" => "hstore"
          }]

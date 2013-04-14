db_name = "#{node['app_name'].gsub('-', '_')}_production"
db_user = node['app_name'].gsub('-', '_')
db_type =
  case node['database']['type']
  when 'postgresql'
    'postgresql'
  when 'mysql'
    'mysql2'
  end

case node['database']['type']
when 'postgresql'
  include_recipe "database::postgres"
when 'mysql'
  include_recipe "database::mysql"
end

include_recipe 'database::database'

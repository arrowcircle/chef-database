db_type =
  case node['database']['type']
  when 'postgresql'
    'postgresql'
  when 'mysql'
    'mysql2'
  end

template "/home/#{node['users']['user']}/projects/#{node['app_name']}/shared/config/database.yml" do
  user node['users']['user']
  owner node['users']['user']
  source "database.yml.erb"
  variables({:db_type => db_type, :db_name => node['database']['db_name'], :db_user => node['database']['username']})
end
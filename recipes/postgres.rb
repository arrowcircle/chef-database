include_recipe 'postgresql'
if node['database']['server'] == true
  include_recipe 'postgresql::server'
  include_recipe 'postgresql::server_dev'
  include_recipe 'postgresql::contrib'
end
include_recipe 'postgresql::libpq'
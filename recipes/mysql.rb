include_recipe 'mysql'
if node['database']['server'] == true
  include_recipe 'mysql::server'
  db_sql = <<-SQL
    CREATE DATABASE IF NOT EXISTS #{node['database']['db_name']};
    GRANT ALL PRIVILEGES ON #{node['database']['db_name']}.*
    TO '#{node["database"]["username"]}'@'localhost' #{ " IDENTIFIED BY '#{node["database"]["password"]}'" if node["database"]["password"].size > 0}
    WITH GRANT OPTION;
  SQL

  execute "mysql create db and user" do
    command "mysql -u root -p#{node['database']['root_password']} -e \"#{db_sql}\""
  end
end
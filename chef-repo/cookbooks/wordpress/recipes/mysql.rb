package 'mysql-server'
package 'mysql-client'

service 'mysql' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

directory "#{node['wordpress']['document_root']}" do
  mode "0777"
  action :create
end

directory "#{node['wordpress']['document_root']}/mysqlConfig" do
  mode "0777"
  action :create
end

cookbook_file "#{node['wordpress']['document_root']}/mysqlConfig/commands.sql" do
  source '/mysql/commands.sql'
end

cookbook_file "#{node['wordpress']['document_root']}/mysqlConfig/wordpressBackup.sql" do
  source '/mysql/wordpressBackup.sql'
end

execute "createUser" do
  command "/usr/bin/mysql -uroot < #{node['wordpress']['document_root']}/mysqlConfig/commands.sql"
end

execute "importBackup" do
  command "/usr/bin/mysql -uroot < #{node['wordpress']['document_root']}/mysqlConfig/wordpressBackup.sql"
end

service 'apache2' do
  action :restart
end
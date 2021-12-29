case node['platform'] 
  when "ubuntu"
    serviceName = "mysql"
  when "centos"
    serviceName = "mysqld"
  else
    serviceName = "mysqld"
end

package 'mysql-server'

service "#{serviceName}" do
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

cookbook_file "#{node['wordpress']['document_root']}/mysqlConfig/wordpressBackup.sql" do
  source '/mysql/wordpressBackup.sql'
end

bash 'configMysql' do
  user 'root'
  code <<-EOH
    sudo mysql
    CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'anothersecurepassword';
    CREATE DATABASE IF NOT EXISTS wordpress;
    GRANT ALL ON *.* to 'username'@'localhost';
  EOH
end

execute "importBackup" do
  command "/usr/bin/mysql -uroot < #{node['wordpress']['document_root']}/mysqlConfig/wordpressBackup.sql"
end

if node['platform'] == 'ubuntu'
  service 'apache2' do
    action :restart
  end
else
  service 'httpd' do
    action :restart
  end
end
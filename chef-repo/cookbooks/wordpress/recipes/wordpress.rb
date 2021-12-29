directory "#{node['wordpress']['server_path']}" do
    mode '0777'
    action :create
end

remote_file 'wordpress' do
    source 'http://wordpress.org/latest.tar.gz'
    mode '0777'
    path "#{node['wordpress']['server_path']}/latest.tar.gz"
    action :create
end

execute "installWp" do
    not_if do
        File.exists?("#{node['wordpress']['server_path']}/wordpress/")
    end
    cwd "#{node['wordpress']['server_path']}"
    command "tar xzvf latest.tar.gz"
end

template "#{node['wordpress']['wp_path']}/wp-config.php" do
    source "wp-config-template.conf.erb"
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

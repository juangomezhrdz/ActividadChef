directory "#{node['wordpress']['server_path']}" do
    mode '0777'
    action :create
end

directory "#{node['wordpress']['wp_path']}" do
    mode '0777'
    action :create
end

execute "downloadWp" do
    not_if do
        File.exists?("latest.tar.gz")
    end
    command "curl -O https://wordpress.org/latest.tar.gz"
end

execute "installWp" do
    not_if do
        File.exists?("/wordpress/")
    end
    command "tar xzvf latest.tar.gz && cp -r /wordpress/* /srv/www/wordpress"
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

case node['platform'] 
    when "ubuntu"
        apachePath = "/etc/apache2"
        fileName = "ports.conf"
        portPath = "/etc/apache2/#{fileName}"
        packageName = "apache2"
    when "centos"
        apachePath = "/etc/httpd"
        fileName = "httpd.conf"
        portPath = "/etc/httpd/conf/#{fileName}"
        packageName = "httpd"
end

package "#{packageName}"

service "#{packageName}" do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
end

directory "#{apachePath}/sites-available" do
    mode "0777"
    not_if do
        File.exists?("#{apachePath}/sites-available")
    end
    action :create
end

directory "#{apachePath}/sites-enabled" do
    mode "0777"
    not_if do
        File.exists?("#{apachePath}/sites-enabled")
    end
    action :create
end

cookbook_file "#{portPath}" do
    source "apache/#{fileName}"
    notifies :restart, resources(:service => "#{packageName}")
end

file "#{apachePath}/sites-enabled/000-default.conf" do
    action :delete
end

template "#{apachePath}/sites-available/vagrant.conf" do
    source 'virtual-hosts.conf.erb'
    notifies :restart, resources(:service => "#{packageName}")
end
  
link "#{apachePath}/sites-enabled/vagrant.conf" do
    to "#{apachePath}/sites-available/vagrant.conf"
    notifies :restart, resources(:service => "#{packageName}")
end

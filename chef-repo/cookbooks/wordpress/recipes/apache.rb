package 'apache2'

service 'apache2' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
end

cookbook_file "/etc/apache2/ports.conf" do
    source "apache/ports.conf"
    notifies :restart, resources(:service => "apache2")
end

cookbook_file "/etc/apache2/default-000.conf" do
    source "apache/ports.conf"
    notifies :restart, resources(:service => "apache2")
end

file '/etc/apache2/sites-enabled/000-default.conf' do
    action :delete
end

template '/etc/apache2/sites-available/vagrant.conf' do
    source 'virtual-hosts.conf.erb'
    notifies :restart, resources(:service => "apache2")
end
  
link '/etc/apache2/sites-enabled/vagrant.conf' do
    to '/etc/apache2/sites-available/vagrant.conf'
    notifies :restart, resources(:service => "apache2")
end

#
# Cookbook Name:: camper
# Recipe:: default
#

template "/etc/nginx/sites-available/camper" do
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :restart, 'service[nginx]'
end

link "/etc/nginx/sites-enabled/camper" do
  to "/etc/nginx/sites-available/camper"
end
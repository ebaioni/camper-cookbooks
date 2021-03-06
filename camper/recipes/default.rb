#
# Cookbook Name:: camper
# Recipe:: default
#

template "/etc/nginx/sites-available/#{node['camper']['site']['name']}" do
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables({
  	:dir => node['camper']['site']['dir'],
  	:static => node['camper']['static'],
  	:expire => node['camper']['expire']
  })
  notifies :restart, 'service[nginx]'
end

link "/etc/nginx/sites-enabled/#{node['camper']['site']['name']}" do
  to "/etc/nginx/sites-available/#{node['camper']['site']['name']}"
end

directory node['camper']['site']['dir'] do
  owner "www-data"
  group "www-data"
  mode 00755
  action :create
  recursive true
end

execute "sync site folder" do
	command "aws s3 sync --delete s3://#{node['camper']['s3-bucket']} #{node['camper']['site']['dir']}"
end

execute "fix permissions" do
	command "sudo chown -R www-data:www-data #{node['camper']['site']['dir']}/*"
end

default['nginx']['server_tokens'] = 'off'
default['nginx']['default_site_enabled'] = false


default['awscli']['config_profiles'] = {}
default['awscli']['config_profiles']['default'] = {}
default['awscli']['config_profiles']['default']['region'] = 'ap-southeast-2'
default['awscli']['config_profiles']['default']['aws_access_key_id'] = ''
default['awscli']['config_profiles']['default']['aws_secret_access_key'] = ''

default['camper'] = {}
default['camper']['site'] = {}
default['camper']['site']['dir'] = "/var/www/camper"
default['camper']['site']['name'] = "camper"

default['camper']['static'] = ['jpg', 'jpeg', 'png', 'gif', 'ico', 'css', 'js', 'svg']
default['camper']['expire'] = "10d"
default['camper']['s3-bucket'] = 'camper-website'
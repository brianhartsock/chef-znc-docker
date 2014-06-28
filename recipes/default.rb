#
# Cookbook Name:: znc_docker
# Recipe:: default
#
#

docker_image node[:znc_docker][:image]

directory node[:znc_docker][:config_directory] do
  owner 'root'
  group 'root'
  mode 0600
  action :create
end

docker_container node[:znc_docker][:image] do
  detach true
  port "#{node[:znc_docker][:port]}:6697"
  volume "#{node[:znc_docker][:config_directory]}:/znc"
end

#
# Cookbook Name:: znc_docker
# Recipe:: default
#
#

directory node[:znc_docker][:config_directory] do
  owner 'root'
  group 'root'
  mode 0700
  action :create
end

docker_image node[:znc_docker][:image]
docker_container node[:znc_docker][:image] do
  container_name 'znc'
  detach true
  port "#{node[:znc_docker][:port]}:6697"
  volume "#{node[:znc_docker][:config_directory]}:/znc"

  action :redeploy
end

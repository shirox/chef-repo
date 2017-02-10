composer_setup_file = "#{Chef::Config[:file_cache_path]}/composer-setup.php"

remote_file composer_setup_file do
  source "https://getcomposer.org/installer"
  action :create
end

execute "composer install" do
  command "php #{composer_setup_file}/composer-setup.php --install-dir=/usr/local/bin --filename=composer"
end


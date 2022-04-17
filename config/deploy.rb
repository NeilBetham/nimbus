# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "nimbus"
set :repo_url, "git@github.com:NeilBetham/nimbus.git"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/opt/nimbus"

# Symlink in appliation state and config
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/nimbus-config.yml', 'db/production.sqlite3'

# Restart servers using tmp/restart.txt
set :passenger_restart_with_touch, true

# Compile assets on the web host
set :assets_roles, [:web, :app]
set :keep_assets, 2

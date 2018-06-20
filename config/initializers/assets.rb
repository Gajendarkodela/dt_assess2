# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( vendor/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( vendor/font-awesome/css/font-awesome.min.css)
Rails.application.config.assets.precompile += %w(css/sb-admin.css)

Rails.application.config.assets.precompile += %w( vendor/jquery.min.js )
Rails.application.config.assets.precompile += %w( vendor/bootstrap.bundle.min.js )
Rails.application.config.assets.precompile += %w( vendor/jquery.easing.min.js)
Rails.application.config.assets.precompile += %w( vendor/Chart.min.js)
Rails.application.config.assets.precompile += %w( vendor/jquery.dataTables.js )
Rails.application.config.assets.precompile += %w(  vendor/dataTables.bootstrap4.js)
Rails.application.config.assets.precompile += %w( vendor/sb-admin.min.js)
Rails.application.config.assets.precompile += %w( vendor/sb-admin-datatables.min.js)
Rails.application.config.assets.precompile += %w( vendor/sb-admin-charts.min.js)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

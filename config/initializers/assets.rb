# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.

# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('public','node_modules')
Rails.application.config.assets.precompile += %w( vendor/bootstrap/css/bootstrap.min.css 
    vendor/font-awesome/css/font-awesome.min.css 
    css/sb-admin.css
    vendor/lightbox.css)
Rails.application.config.assets.precompile += %w( vendor/jquery.min.js'
    vendor/bootstrap.bundle.min.js
    vendor/bootstrap.min.js
    vendor/jquery.dataTables.js
    vendor/dataTables.bootstrap4.js
    vendor/sb-admin.min.js
    vendor/sb-admin-datatables.min.js
    vendor/sb-admin-charts.min.js
    notify.min.js
    vendor/lightbox.js
    
    )
Rails.application.config.assets.precompile += %w(ckeditor/config.js)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

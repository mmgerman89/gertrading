# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( my_stocks.js )
Rails.application.config.assets.precompile += %w( registrations.js )
Rails.application.config.assets.precompile += %w( rate_charts.js )
Rails.application.config.assets.precompile += %w( stocks.js )
Rails.application.config.assets.precompile += %w( sessions.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.pie.js )
Rails.application.config.assets.precompile += %w( flot/excanvas.min.js )
Rails.application.config.assets.precompile += %w( flot/flot-data.js )
Rails.application.config.assets.precompile += %w( flot/jquery.min.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.tooltip.js )
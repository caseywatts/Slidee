source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'



##Specific to our App
gem 'etherpad-lite', :git => "git://github.com/jhollinger/ruby-etherpad-lite.git"
gem 'pg'
gem 'rmagick', :require => false #require false is because it always explodes errors everywhere :P
gem 'paperclip'
gem 'rubycas-client', "2.2.1" #bug https://github.com/rubycas/rubycas-client-rails/issues/6
gem 'rubycas-client-rails'
gem 'ruby-prof'
gem 'aws-sdk'
gem 'prawn'
gem 'wicked_pdf'
gem 'docsplit', '0.6.0'
gem 'docsplit-paperclip-processor', :git => "git://github.com/tienle/docsplit-paperclip-processor.git"

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'pry'
  gem 'pry-rails'
  gem 'mysql2' #because it's easier to work with - we don't need pg like Heroku does
  gem 'factory_girl_rails'
  gem 'ffaker'
end

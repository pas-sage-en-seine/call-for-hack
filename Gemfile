source 'https://rubygems.org'

gem 'rails', '5.0.2'

gem 'scrypt'
gem 'puma'

group :assets do
	gem 'sass-rails'
	gem 'coffee-rails'
	gem 'jquery-rails'
	#gem 'jquery-ui-rails'
	gem 'bootstrap-sass'
	#gem 'font-awesome-sass'
	#gem 'bootstrap-switch-rails'
	#gem 'turbolinks'
	#gem 'turbolinks-redirect'
	gem 'therubyracer', platforms: :ruby
	gem 'uglifier'
end

group :production do
	gem 'pg', '< 1.0'
end

group :development do
	gem 'sqlite3'
	#gem 'debase'
	#gem 'ruby-debug-ide'
	gem 'pry-rails'

	gem 'better_errors'
	gem 'binding_of_caller'
	#gem 'quiet_assets'

	gem 'guard-livereload'
	gem 'rack-livereload'
end

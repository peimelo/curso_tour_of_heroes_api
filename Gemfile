source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "active_model_serializers", "~> 0.10.12"
gem "rack-cors", "~> 1.1"
gem "rubocop", require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem "rspec-rails", "~> 4.0"
  gem "factory_bot_rails", "~> 6.1"
  gem "faker", "~> 2.15"
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "spring-commands-rspec", "~> 1.0"
end

group :test do
  gem "shoulda-matchers", "~> 4.5"
  gem "simplecov", "~> 0.21.2", require: false
end

group :production do
  gem "pg", "~> 1.2"
end

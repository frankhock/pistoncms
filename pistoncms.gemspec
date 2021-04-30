$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pistoncms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pistoncms"
  s.version     = Pistoncms::VERSION
  s.authors     = ["Frank Hock"]
  s.email       = ["frank@thinkmechanic.com"]
  s.homepage    = "http://www.pistoncms.com"
  s.summary     = "The Developer's CMS"
  s.description = "Description of Pistoncms."

  s.test_files = Dir["spec/**/*"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  # Dependencies
  s.add_dependency 'bootstrap-sass-rails',      '~> 3.0.0.3'
  s.add_dependency 'carrierwave',               '~> 0.9.0'
  s.add_dependency 'ckeditor',                  '~> 4.0.6'
  s.add_dependency 'coffee-rails',              '~> 4.0.0'
  s.add_dependency 'compass-rails',             '~> 2.0.alpha.0'
  s.add_dependency 'friendly_id',               '~> 5.0.0'
  s.add_dependency 'gon',                       '>=4.1.1', '<6.5.0'
  s.add_dependency 'jquery-rails',              '~> 3.0.4'
  s.add_dependency 'jquery-fileupload-rails',   '~> 0.4.1'
  s.add_dependency 'paranoia',                  '~> 2.0.0'
  s.add_dependency 'rails',                     '~> 4.0.0'
  s.add_dependency 'rmagick',                   '~> 2.13.2'
  s.add_dependency 'sass-rails',                '~> 4.0'
  s.add_dependency 'slim-rails',                '>= 2.0.3'

  # Development Dependencies
  s.add_development_dependency 'capybara', '2.1.0'
  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails', '2.14.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.1'

end

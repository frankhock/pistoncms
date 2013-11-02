require 'bootstrap-sass-rails'
require 'carrierwave'
require 'ckeditor'
require 'sass-rails'
require 'coffee-rails'
require 'compass-rails'
require 'friendly_id'
require 'gon'
require 'jquery-rails'
require 'jquery-fileupload-rails'
require 'paranoia'
require 'rmagick'
require 'slim-rails'

module Pistoncms
  class Engine < ::Rails::Engine

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
      g.template_engine :slim
    end
  end
end

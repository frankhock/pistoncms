require 'bootstrap-sass-rails'
require 'ckeditor'
require 'sass-rails'
require 'coffee-rails'
require 'friendly_id'
require 'jquery-rails'
require 'paranoia'
require 'slim-rails'

module Pistoncms
  class Engine < ::Rails::Engine

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
      g.template_engine :slim
    end
  end
end

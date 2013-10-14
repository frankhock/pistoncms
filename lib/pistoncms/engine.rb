require 'bootstrap-sass-rails'
require 'ckeditor'
require 'sass-rails'
require 'coffee-rails'
require 'jquery-rails'
require 'slim-rails'

module Pistoncms
  class Engine < ::Rails::Engine
    isolate_namespace Pistoncms

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
      g.template_engine :slim
    end
  end
end

require 'rails/generators'
require File.expand_path('../utils', __FILE__)
require File.expand_path('../migrations', __FILE__)

# inspired by https://github.com/sferik/rails_admin/blob/master/lib/generators/rails_admin/install_generator.rb

module Pistoncms
  class UpdateGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    include Rails::Generators::Migration
    include Generators::Utils::InstanceMethods
    extend Generators::Utils::ClassMethods
    include Generators::Migrations

    def update

      display "Hello, Pistoncms will now try updating", :magenta
      display "Updating Pistoncms gem"
      Bundler.with_clean_env do 
        run "bundle update pistoncms"
      end
      display "Lets try to find some migrations you might need", :magenta
      run_migrations

      display "Pistoncms update complete! :)"
    end

  end
end
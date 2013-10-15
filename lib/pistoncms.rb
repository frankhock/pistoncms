require 'pistoncms/engine'
require 'pistoncms/config'

module Pistoncms

  def self.config(&block)
    Pistoncms::Config
  end

end

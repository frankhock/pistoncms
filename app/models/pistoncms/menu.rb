module Pistoncms
  class Menu < ActiveRecord::Base
    self.table_name = 'pistoncms_menus'
    acts_as_paranoid

    validates :name, presence: true, uniqueness: true

  end
end

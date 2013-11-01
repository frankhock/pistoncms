module Pistoncms
  class Media < ActiveRecord::Base
    self.table_name = 'pistoncms_media'

    # Carrierwave Uploader
    mount_uploader :file, Pistoncms::FileUploader

    #-----------------#
    # - Associations -#
    #-----------------#

  end
end
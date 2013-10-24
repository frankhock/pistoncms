# Pistoncms config file. Generated on October 15, 2013 12:03

Pistoncms.config do |config|

  ################  Global configuration  ################

  # Pistoncms may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated
  
end

Pistoncms.config.public_layout = 'application'

Pistoncms.config.additional_admin_menu_items = [{title: "Test", link: "http://www.google.com", icon: 'glyphicon-cog'}]


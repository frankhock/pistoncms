require 'spec_helper'

module RequestMacros

 def logout_user(user = @current_user)
    Capybara.reset_sessions!
    visit destroy_admin_session_url
  end
 
  def login(sym)
    logout_user if @current_user
    @current_user = FactoryGirl.create(sym.to_sym)
    visit new_admin_session_url
    fill_in I18n.t('activerecord.attributes.admin.email'), :with => @current_user.email
    fill_in I18n.t('activerecord.attributes.admin.password'), :with => @current_user.password
    click_button I18n.t('devise.shared.links.sign_in')  end

end
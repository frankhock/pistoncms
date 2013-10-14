require 'spec_helper'

feature 'Pages' do 
  let(:new_page_page) { NewPagePage.new }

  scenario 'creating a page' do 
    visit pistoncms.new_page_url
    new_page_page.create_page

    success_message = "Page published."
    page.should have_content(success_message)
  end
end
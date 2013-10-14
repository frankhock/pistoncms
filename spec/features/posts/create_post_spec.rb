require 'spec_helper'

feature 'Posts' do 
  let(:new_post_page) { NewPostPage.new }

  scenario 'creating a post' do 
    
    visit pistoncms.new_post_url
    new_post_page.create_post
    
    success_message = "Post published."
    page.should have_content(success_message)
  end
  
end
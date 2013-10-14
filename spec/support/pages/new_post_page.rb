class NewPostPage
  include Capybara::DSL

  def create_post
    within('form#new_post') do
      fill_in 'post_title', with: 'Test'
      click_button "Publish"
    end
  end

end
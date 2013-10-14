class NewPagePage
  include Capybara::DSL

  def create_page
    fill_in 'page_title', with: 'Test'
    click_button "Publish"
  end

end
require 'spec_helper'

describe Pistoncms::MenusController, :type => :controller do 
  render_views
  login_admin

  describe 'GET index' do 
    before do 
      get :index
    end

    it { should render_template(:index) }
  end

end
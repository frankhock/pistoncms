require 'spec_helper'

describe Pistoncms::MenusController, :type => :controller do 
  render_views
  login_admin

  let!(:menu) { create(:menu, name: "bottom") }

  describe 'GET index' do 
    before do 
      get :index
    end

    it { should render_template(:index) }

    it 'assigns menus' do 
      assigns(:menus).should eq([menu])
    end
  end

end
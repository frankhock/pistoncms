require 'spec_helper'

describe Pistoncms::Public::PagesController, :type => :controller do 
  render_views

  let(:page) { create(:page, title: "holla") }

  describe 'GET show' do 

    context 'with existing page' do 
      before { get :show, slug: page.slug }

      it { should render_template(:show) }

      it 'should assign page' do 
        assigns(:page).should eq(page)
      end
    end

    context 'with non-existent page' do 
      before { get :show, slug: "fuck" }
      
      it { should respond_with 404 }
    end

  end
end


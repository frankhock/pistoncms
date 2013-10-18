require 'spec_helper'

module Pistoncms 
  module Public


    describe EntriesController, :type => :controller do 
      render_views

      let!(:post) { create(:post) }
      let!(:page) { create(:page, title: "pager") }

      describe 'GET show' do 

        context 'when entry is a page' do 
          before { get :show, slug: page.title }

          it 'should assign entry' do 
            assigns(:entry).should eq(page)
          end
        end

        # context 'with existing page' do 
        #   before { get :show, id: page.id }

        #   it { should render_template(:show) }

        #   it 'should assign page' do 
        #     assigns(:page).should eq(page)
        #   end
        # end

        # context 'with non-existent page' do 
        #   before { get :show, id: 99999}
          
        #   it { should respond_with 404 }
        # end

      end
    end


  end
end
require 'spec_helper'

module Pistoncms 
  module Public


    describe EntriesController, :type => :controller do 
      render_views

      let!(:post) { create(:post, title: "poster") }
      let!(:page) { create(:page, title: "pager") }

      describe 'GET show' do 

        context 'when entry is a page' do 
          before { get :show, slug: page.title }

          it 'should assign entry' do 
            assigns(:entry).should eq(page)
          end
        end

        context 'when entry is a post' do 
          before { get :show, slug: post.title }

          it 'should assign entry' do 
            assigns(:entry).should eq(post)
          end
        end

      end
    end

  end
end
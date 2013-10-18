require 'spec_helper'

describe Pistoncms::Public::PostsController, :type => :controller do 
  render_views

  let(:post) { create(:post, title: "holla") }

  describe 'GET show' do 

    context 'with existing post' do 
      before { get :show, post_slug: post.slug }

      it { should render_template(:show) }

      it 'should assign page' do 
        assigns(:post).should eq(post)
      end
    end

    context 'with non-existent post' do 
      before { get :show, post_slug: "fuck" }
      
      it { should respond_with 404 }
    end

  end
end
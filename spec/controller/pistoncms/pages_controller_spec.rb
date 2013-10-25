require 'spec_helper'

module Pistoncms

  describe PagesController, :type => :controller do
    render_views
    login_admin

    let!(:page) { create(:page) }

    describe 'GET index' do

      before do
        get :index
      end

      it { should render_template(:index) }

      it 'should assign @entries' do
        assigns(:entries).should eq([page])
      end
    end

    describe 'GET edit' do
      before do
        get :edit, id: page.id
      end

      it { should render_template(:edit) }

      it 'should assign entry' do
        assigns(:entry).should eq(page)
      end
    end

    describe 'PUT update' do

      context 'with valid params' do
        before :each do
          put :update, id: page.to_param, pistoncms_page: {title: page.title}
        end

        it 'should set flash' do
          expect(flash[:notice]).not_to be_nil
        end

        it 'should redirect to edit' do
          expect(response).to be_redirect
        end
      end

      context 'with invalid params' do
        before do
          put :update, id: page.to_param, pistoncms_page: {title: ""}
        end

        it 'should render edit' do
          response.should render_template("edit")
        end
      end

    end

  end

end
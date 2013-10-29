require 'spec_helper'

describe Pistoncms::MediaController, :type => :controller do 
  login_admin

  let(:file) { fixture_file_upload('/test.png', "image/png") }

  context 'with valid params' do 
    describe 'POST create' do 

      before do 
        xhr :post, :create, media: { file: file }
      end 

      it { should respond_with(200) }
      it { should render_template(:create) }
    end
  end

end
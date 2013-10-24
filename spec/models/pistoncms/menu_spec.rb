require 'spec_helper'

module Pistoncms
  describe Menu do

    it 'should have valid factory' do 
      FactoryGirl.build(:menu).should be_valid
    end

    describe 'validations' do 
      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
    end

  end
end

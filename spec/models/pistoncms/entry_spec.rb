require 'spec_helper'

module Pistoncms
  describe Entry do
    let!(:entry) { create(:entry, title: "Hello There") }

    describe 'validations' do

      it { should validate_uniqueness_of(:title) }
      it { should validate_uniqueness_of(:name) }

      before { subject.save }
      [:title, :name].each do |attribute|

        context "when #{attribute} is nil" do 
          subject { Entry.new(attribute => nil) }
          it "shouldn't allow blank #{attribute}" do 
            expect(subject.errors_on(attribute)).to include("can't be blank")
          end
        end

      end
    end

    it 'should set name' do 
      entry.name.should eq("hello-there")
    end

  end
end

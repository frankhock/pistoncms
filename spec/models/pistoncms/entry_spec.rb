require 'spec_helper'

module Pistoncms
  describe Entry do
    let!(:entry) { create(:entry, title: "Hello There") }

    describe 'validations' do

      it { should validate_uniqueness_of(:title) }
      it { should validate_uniqueness_of(:name) }

      before { subject.save }
      [:title].each do |attribute|

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

    context 'instance of entry' do 

      describe '#type' do 
        let(:page) { build(:page) }

        context 'namespace true' do 
          it 'should set type' do 
            page.type.should eq("Pistoncms::Page")
          end
        end

        context 'namespace false' do 
          it 'should set type' do 
            page.type(namespace: false).should eq("Page")
          end
        end
      end

    end

  end
end

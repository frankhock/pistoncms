require 'spec_helper'

module Pistoncms

  describe EntryBulkActionHandler do 
    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }
    let(:params) { { bulk_action: 'trash', entry: [ post1.id, post2.id ] } }
    subject { EntryBulkActionHandler.new(params) }

    context 'when initializing' do 
      it 'should set action' do 
        subject.action.should eq('trash')
      end

      it 'should set entries' do 
        subject.entries.should eq([post1.id, post2.id])
      end
    end

    describe '#execute' do 

      context 'when action is TRASH' do 

        context 'when there are entries to delete' do 

          it 'deletes selected entries' do 
            expect { subject.execute }.to change { Pistoncms::Entry.all.count }.by(-2)
          end

        end
      end

    end

  end

end
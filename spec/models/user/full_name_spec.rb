# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    let(:user) { create(:user) }
    subject { user.full_name }

    context 'without any stub' do
      it 'returns John Doe' do
        expect(subject).to eq('John Doe')
      end
    end

    context 'with any_instance stub' do
      before do
        allow_any_instance_of(User).to receive(:name).and_return('Jane')
      end
      it 'returns John Doe' do
        expect(subject).to eq('Jane Doe')
      end
    end

    context 'with instance stub' do
      before do
        allow(user).to receive(:last_name).and_return('Roe')
      end
      it 'returns John Roe for user and John Doe for another' do
        expect(subject).to eq('John Roe')
        another_user = create(:user)
        expect(another_user.full_name).to eq('John Doe')
      end
    end

    context 'with mock' do
      it 'calls name and full_name' do
        expect(user).to receive(:name).exactly(2).times.and_return('Johnny')
        expect(user).to receive(:last_name).exactly(2).times.and_return('Poe')
        subject
      end
    end

    context 'with double' do
      let(:user) { double(:user, full_name: 'Janie Doe') }

      it 'calls name and full_name' do
        expect(subject).to eq('Janie Doe')
        expect(user).not_to be_a(User)
      end
    end

    context 'with flaky code' do
      it 'returns John Doe' do
        travel_to Time.zone.local(2004, 11, 24, 0o1, 0o4, 44) do
          expect(subject).to eq('John Doe')
        end
      end
    end
  end
end

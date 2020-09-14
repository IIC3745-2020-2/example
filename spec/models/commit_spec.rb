# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Commit, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:sha) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:pusher) }
    it { should validate_presence_of(:ref) }
  end

  describe 'uniqueness' do
    subject { create(:commit) }
    it { should validate_uniqueness_of(:sha) }
  end

  describe 'associations' do
    it { should belong_to(:repository).required }
  end

  describe 'columns' do
    it { should have_db_column(:sha).of_type(:string).with_options(null: false) }
    it { should have_db_column(:message).of_type(:string).with_options(null: false) }
    it { should have_db_column(:pusher).of_type(:string).with_options(null: false) }
    it { should have_db_column(:ref).of_type(:string).with_options(null: false) }
    it { should have_db_column(:repository_id).of_type(:integer).with_options(null: false) }
  end

  describe 'indexes' do
    it { should have_db_index(:sha).unique }
    it { should have_db_index(:repository_id) }
  end
end

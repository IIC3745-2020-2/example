# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:url) }
  end

  describe 'uniqueness' do
    subject { create(:repository) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:full_name) }
    it { should validate_uniqueness_of(:url) }
  end

  describe 'associations' do
    it { should have_many(:commits).dependent(:destroy) }
  end

  describe 'columns' do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:full_name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:url).of_type(:string).with_options(null: false) }
  end

  describe 'indexes' do
    it { should have_db_index(:name).unique }
    it { should have_db_index(:full_name).unique }
    it { should have_db_index(:url).unique }
  end
end

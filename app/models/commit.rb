# frozen_string_literal: true

class Commit < ApplicationRecord
  validates :sha, presence: true, uniqueness: true
  validates :message, presence: true
  validates :pusher, presence: true
  validates :ref, presence: true

  belongs_to :repository, optional: false
end

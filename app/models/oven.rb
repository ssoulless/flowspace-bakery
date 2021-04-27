# frozen_string_literal: true

# Oven Model
class Oven < ActiveRecord::Base
  belongs_to :user
  has_one :cookie, as: :storage

  validates :user, presence: true
end

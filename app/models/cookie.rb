# frozen_string_literal: true

# Cookie class
# Fields:
# Filling: string
# cooked: boolean
class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: true

  validates :storage, presence: true

  after_save :cook_cookie

  def ready?
    cooked?
  end

  private

  def cook_cookie
    return if cooked?

    CookCookieWorker.perform_in(5.seconds, id)
  end
end

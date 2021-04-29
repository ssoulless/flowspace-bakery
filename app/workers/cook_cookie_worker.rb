# frozen_string_literal: true

# Cook Cookie Worker
# Cooks a cookie
# Params:
# cookie_id: Integer
class CookCookieWorker
  include Sidekiq::Worker

  sidekiq_options retry: true, queue: 'cookies'

  def perform(cookie_id)
    cookie = Cookie.find_by(id: cookie_id)

    return unless cookie

    CookieCookerService.call(cookie)
    OvenCheckerService.call(cookie.storage)
  end
end

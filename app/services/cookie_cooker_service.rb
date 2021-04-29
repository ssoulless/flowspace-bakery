# frozen_string_literal: true

# CookieCooker Service
# Service in charge of cook a cookie
class CookieCookerService
  def self.call(cookie)
    cookie.update_column(:cooked, true)
  end
end

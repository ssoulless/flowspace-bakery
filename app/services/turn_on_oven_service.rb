# frozen_string_literal: true

# TurnOnOvenService
# Service in charge of setting default state of oven when we insert the cookies
class TurnOnOvenService
  def self.call(oven, quantity)
    oven.update_column(:status, 'cooking')
    oven.update_column(:cookies_quantity, quantity)
    oven
  end
end

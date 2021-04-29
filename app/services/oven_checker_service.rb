# frozen_string_literal: true

# OvenCheckerService Service
# Service in charge of checking if all the cookies in the oven are ready
class OvenCheckerService
  def self.call(oven)
    cookies_cooked_statuses = Cookie.group(:cooked).where(storage_id: oven.id, storage_type: 'Oven')
                                    .count(:cooked)
    if cookies_cooked_statuses.key?(false)
      oven.update_column(:status, 'cooking')
    else
      oven.update_column(:status, 'ready')
    end
  end
end

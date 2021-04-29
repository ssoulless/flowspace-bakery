# frozen_string_literal: true

# OvenCheckerService
# Service in charge of checking if all the cookies in the oven are ready
class OvenCheckerService
  def self.call(oven)
    cookies_cooked_statuses = Cookie.group(:cooked).where(storage_id: oven.id, storage_type: 'Oven')
                                    .count(:cooked)

    return if cookies_cooked_statuses.key?(false)
    return unless oven.cookies_quantity == oven.cookies.count

    oven.update_column(:status, 'ready')
    puts '------ ActionCable -----'
    ActionCable.server.broadcast 'ovenstatus_channel', status: '(Your Cookie is Ready)',
                                                       id: oven.id
  end
end

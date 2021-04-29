# frozen_string_literal: true

require 'rails_helper'

describe CookCookieWorker do
  let(:user) { FactoryGirl.create(:user) }
  let(:oven) { user.ovens.first }

  it { is_expected.to be_processed_in :cookies }

  it 'enqueues the cook cookies worker to be processed in 5 seconds' do
    oven.cookies.create!({ fillings: 'Vanilla' })
    cookie = oven.cookies.last

    # CookCookieWorker.perform_in(5.seconds, cookie.id)
    # expect(CookCookieWorker).to have_enqueued_sidekiq_job(cookie.id).in(5.seconds)
  end
end

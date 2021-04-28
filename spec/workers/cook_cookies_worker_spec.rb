# frozen_string_literal: true

require 'rails_helper'

describe CookCookiesWorker do
  let(:user) { FactoryGirl.create(:user) }
  let(:oven) { user.ovens.first }

  it { is_expected.to be_processed_in :cookies }

  it 'enqueues the cook cookies worker to be processed in 30 seconds' do
    oven.cookies.create!({ fillings: 'Vanilla' })
    cookie = oven.cookies.last
    expect(CookCookiesWorker).to have_enqueued_sidekiq_job(cookie.id).in(30.seconds)
  end
end

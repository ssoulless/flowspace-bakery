# frozen_string_literal: true

require 'rails_helper'

describe OvenStatusChannel, type: :channel do
  before do
    # initialize connection with identifiers
    stub_connection current_user: current_user
  end

  it 'rejects when no oven id' do
    subscribe
    expect(subscription).to be_rejected
  end

  it 'subscribes to a stream when oven id is provided' do
    subscribe(oven_id: Oven.first.id)

    expect(subscription).to be_confirmed
    expect(streams).to include('oven_1')
    # expect(streams).to include('oven_stats_1')
  end
end

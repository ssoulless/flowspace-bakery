# frozen_string_literal: true

# OVenStatusChannel Tracks status of an Oven
class OvenStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ovenstatus_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

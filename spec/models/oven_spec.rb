# frozen_string_literal: true

require 'rails_helper'

describe Oven do
  subject { Oven.new }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:cookies) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
  end
end

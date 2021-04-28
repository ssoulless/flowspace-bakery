# frozen_string_literal: true

class OvensController < ApplicationController
  before_action :authenticate_user!

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
    @cookie = @oven.cookies.first
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    if @oven.cookies.present?
      @oven.cookies.each do |cookie|
        cookie.update_attributes!(storage: current_user)
      end
    end
    redirect_to @oven, alert: 'Oven emptied!'
  end
end

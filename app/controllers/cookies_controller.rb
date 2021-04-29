# frozen_string_literal: true

# Cookies Controller
class CookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.cookies.any?
      redirect_to @oven, alert: 'There are cookies already in the oven!'
    else
      @cookie = @oven.cookies.build
    end
  end

  def create
    quantity = params[:quantity].to_i
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    TurnOnOvenService.call(@oven, quantity)

    quantity.times do
      @oven.cookies.create!(cookie_params)
    end

    redirect_to oven_path(@oven)
  end

  private

  def cookie_params
    params.require(:cookie).permit(:fillings)
  end
end

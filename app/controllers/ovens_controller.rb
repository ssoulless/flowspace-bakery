# frozen_string_literal: true

class OvensController < ApplicationController
  before_action :authenticate_user!

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    @oven.cookie&.update_attributes!(storage: current_user)
    redirect_to @oven, alert: 'Oven emptied!'
  end
end

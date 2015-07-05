class UserActionsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :authenticate_user!

  def index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = @current_user
  end
end

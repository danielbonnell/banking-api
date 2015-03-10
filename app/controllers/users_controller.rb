class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    gon.assets = @user.net_worth("assets")
    gon.debts = @user.net_worth("debts")
  end

  def show
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end

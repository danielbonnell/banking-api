class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    gon.assets = @user.account.balance(@user, "assets")
    gon.debts = @user.account.balance(@user, "debts")
end

  def show
    @user = User.find(params[:id])
    
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end

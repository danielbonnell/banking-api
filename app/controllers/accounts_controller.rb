class AccountsController < ApplicationController
  before_filter :authenticate_user!

  # def index
  #   @user = current_user
  #   @accounts = @user.accounts
  # end
  #
  def show
    @account ||= Account.new.account(current_user, params[:id])
  end
end

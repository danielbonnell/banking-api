class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @account = Account.new(current_user, params[:id])
  end
end

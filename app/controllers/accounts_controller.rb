class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @account = Account.new(current_user, params[:id])

    if params[:page]
      @transactions = @account.transactions(params[:page])
    else
      @transactions = @account.transactions
    end
  end
end

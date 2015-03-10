class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new
    @user.attributes = register_params

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  protected

  def after_sign_up_path_for(user)
    user_path(user)
  end

  private

  def register_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end

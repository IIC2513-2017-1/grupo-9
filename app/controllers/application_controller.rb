class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin

  protected

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session.key?(:user_id) && User.find_by(id:session[:user_id])
  end

    def is_admin
    return true unless current_user.try(:role) != 'Admin'
    false
  end

end

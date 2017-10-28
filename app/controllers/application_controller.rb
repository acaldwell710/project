class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

rescue_from Pundit::NotAuthorizedError do
  redirect_to root_url, alert: 'You do not have access to this page.'
end

  #private
  #def require_sign_in
  #  unless current_user
  #    flash[:alert] = "You must be logged in to do that"
  #    redirect_to new_session_path
  #  end
  #end
end

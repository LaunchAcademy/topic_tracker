class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in
    render status: :forbidden if current_user.nil?
  end

  def user_made_post
    set_topic
    redirect_to root_path, notice: 'Not your post!' if @topic.user != current_user
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :all
  helper_method :current_user
  helper_method :logged_in?

  # 渡されたユーザーでログインする
   def log_in(user)
     session[:user_id] = user.id
   end

   # ログアウト
   def log_out
    session.delete(:user_id)
    @current_user = nil
   end

   # 現在のユーザー
   def current_user
     @current_user ||= User.find_by(id: session[:user_id])
   end

   def logged_in?
      !current_user.nil?
   end

end

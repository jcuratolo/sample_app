module SessionsHelper

  def sign_in(user)
    #cookies.permanent[:remember_token] = user.remember_token
    #self.set_current_user(user)
    #set_current_user(user)
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def set_current_user(user)
    @current_user = user
  end

  def current_user
    #@current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_out
    #self.set_current_user(nil)
    #set_current_user(nil)
    #cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
    puts "*** CURRENT_USER: #{current_user}"
  end
end

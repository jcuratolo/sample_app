class SessionsController < ApplicationController
  def new
   @title = "Sign in"
 end

 def create
  @title = "Sign in"
  user = User.find_by_email(params[:session][:email])
  if user && user.authenticate(params[:session][:password])
    @title = user.name
    sign_in user
    redirect_to user
  else
    flash.now[:danger] = "Invalid email/password combination"
    render 'new'
  end
end

def destroy
  sign_out if signed_in?
  redirect_to root_path
end
end

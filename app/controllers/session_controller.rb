class SessionController < ApplicationController

  def new
  end
  def create
    user = User.find_by(email: params[:email])

    if user && user.autheticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      render :new
    end
  end
end

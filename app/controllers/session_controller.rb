class SessionController < ApplicationController

  def new
  end
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
    # render text: request.env['omniauth.auth'].to_yaml
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

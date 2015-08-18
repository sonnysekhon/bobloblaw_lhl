class SessionController < ApplicationController

  def new
  end
  def create

    # user = User.find_by(email: params[:email])

    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   render :new
    # end
    # render text: request.env['omniauth.auth'].to_yaml
    begin
      data = request.env['omniauth.auth'].extra.raw_info
      @user = User.from_omniauth(request.env['omniauth.auth'].extra)
      binding.pry
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
    
  end
  
  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to '/'
  # end
end

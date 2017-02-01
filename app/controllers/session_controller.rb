class SessionController < ApplicationController
   def index
  end

  def new
  end

  def create
    user = User.find_by(email:params[:email])
      if user && user.try(:authenticate, params[:password])
        session[:user_id] = user.id
        session[:username] = user.first_name
        puts "new session: user return= #{user}"
        redirect_to "/event"
      else
        flash[:notice] = ["Invalid Log-in"]
        redirect_to '/session/new'
      end 
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/session/new'
  end



private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  
end

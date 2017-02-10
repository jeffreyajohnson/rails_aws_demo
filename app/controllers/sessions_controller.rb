class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by(email:params[:email])
      if user && user.try(:authenticate, params[:password])
        session[:user_id] = user.id
        session[:username] = user.name
        puts "new session: user return= #{user}"        
        redirect_to "/bright_ideas"
      else
        flash[:notice] = ["Invalid Log-in"]
        redirect_to '/sessions/new'
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
    session[:username] = nil
    redirect_to '/sessions/new'
  end



private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end

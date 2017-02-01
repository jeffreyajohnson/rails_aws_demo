class UserController < ApplicationController
 before_action :require_login, except: [:new, :create]
 

  def index
  end

  def new
  end

  def create
    if !Location.find_by(city: params[:city])
        location = Location.create(location_params)
    else
      location = Location.find_by(city: params[:city])
    end

    user = User.new(user_params)
    user.update(location: location)
    puts "**in user create method**"
    if user.valid?
      puts "...user valid"
      user.save
      session[:user_id]= user.id
      session[:name]= user.first_name
      puts "in user#create method => user: #{user.inspect}"
      redirect_to "/user/#{user.id}"
    else 
      puts "...user INVLAID"
      flash[:notice] = user.errors.full_messages
      for error in flash[:notice]
        puts "error: #{error}"
      end
      redirect_to :back 
    end
    
  end
   
  def show
    puts "***************in user show method damn it!!!!!!!! *******"
    puts "user show params[:id] = #{params[:id]}"
    id = params[:id]
    @user = User.find(id)
    puts "********in user show method; @user.id = #{@user.id}"    
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def update
    puts"**updating............."
    id = params[:id]
    @user = User.find(id)
    if !Location.find_by(city: params[:city])
        location = Location.create(city:params[:city], state:params[:state])
    else
      location = Location.find_by(city: params[:city])
    end
    @user.update_attribute(:first_name, params[:first_name])
    @user.update_attribute(:last_name, params[:last_name])
    @user.update_attribute(:location_id, location.id)
    if params[:email] != @user.email && User.find_by(email: params[:email])
      flash[:notice] = ["Email already exists"]
    elsif params[:email] != @user.email
      @user.update_attribute(:email, params[:email])
    end
   
    puts "user= #{@user.inspect}"
    if flash[:notice]
      redirect_to "/user/#{id}/edit"
    else 
      redirect_to "/user/#{id}"
    end
  end

  def destroy
    puts "***destroying user***"
    id = params[:id]
    User.find(id).delete
    session[:user_id] = nil
    puts "***redirect_to session/new ***"
    redirect_to '/session/new'
  end


  private
    def location_params
       params.require(:location).permit(:city, :state)
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
    end
end

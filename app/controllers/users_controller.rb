class UsersController < ApplicationController
   def index
  end

  def new
  end

  def create
    user = User.new(user_params)
    puts "**in user create method**"
    if user.valid?
      puts "...user valid"
      user.save
      session[:user_id]= user.id
      session[:username]= user.name
      puts "in user#create method => user: #{user.inspect}"
      
      redirect_to "/bright_ideas"
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
    puts "user show params[:id] = #{params[:id]}"
    id = params[:id]
    @user = User.find(id)
    puts "********in user show method; @user.id = #{@user.id}"   
    # @ideas = @user.ideas_liked.group(:id) 
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def update
    puts"**updating............."
    id = params[:id]
    @user = User.find(id)
   
    @user.update_attribute(:name, params[:name])
    @user.update_attribute(:alias, params[:alias])
    if params[:email] != @user.email && User.find_by(email: params[:email])
      flash[:notice] = ["Email already exists"]
    elsif params[:email] != @user.email
      @user.update_attribute(:email, params[:email])
    end
   
    puts "user= #{@user.inspect}"
    if flash[:notice]
      redirect_to "/users/#{id}/edit"
    else 
      redirect_to "/users/#{id}"
    end
  end

  def destroy
    puts "***destroying user***"
    id = params[:id]
    User.find(id).delete
    session[:user_id] = nil
    session[:username] = nil
    puts "***redirect_to session/new ***"
    redirect_to '/session/new'
  end


  private
    def user_params
      params.require(:user).permit(:name, :alias,:email, :password, :password_confirmation)
    end
end

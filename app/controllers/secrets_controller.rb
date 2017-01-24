class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  
  def index
  	@secrets = Secret.all
  end
  def create
  	puts "in Secrets create method..........."
  	User.find(session[:user_id]).secrets.create(content:params[:New_Secret])
  	puts "now redirect_to /users/#{session[:user_id]}"
  	redirect_to "/users/#{session[:user_id]}"
  end
  def destroy
  	secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to "/users/#{current_user.id}"
  end

end

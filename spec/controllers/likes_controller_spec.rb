require 'rails_helper'
# RSpec.describe LikesController, type: :controller do
	
  # before do
  #   @user = create_user
  #   @controller = SecretsController.new
  # end

  # describe "when not logged in" do
  # 	before do 
  # 		session[:user_id] = nil  		
  # 	end

  #   it "cannot access secrets page in order to like or unlike" do
		# get :index
		# expect(response).to redirect_to('/sessions/new')
  #   end
  # end

RSpec.describe LikesController, :type => :controller do
  before do
    user = create_user
    secret = user.secrets.create(content: "Oops")
    @like = user.likes.create(user: user, secret: secret)
  end

  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access create" do 
      post :create
      expect(response).to redirect_to("/sessions/new")      
    end

    it "cannot access destroy" do
      delete :destroy, params:{id: @like}
    end
  end #end describe "when not logged in" 

  describe "when signed in as the wrong user" do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
    end
    it "cannot access create" do 
      post :create
      expect(response).to redirect_to("/sessions/new")      
    end

    it "cannot access destroy" do
      delete :destroy, params:{id: @like}
    end    
  end 
   
end



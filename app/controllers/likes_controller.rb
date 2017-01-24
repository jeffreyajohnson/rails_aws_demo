class LikesController < ApplicationController

  before_action :require_login, only: [:create, :destroy]
  before_action :require_correct_user, only: [:create, :destroy]

#   def create
#     secret = Secret.find(params['secret_id'])
#     like = Like.create(user: current_user, secret: secret)
#     redirect_to :back
#   end

#   def destroy
#     like = Like.find(params[:id]).destroy
#     redirect_to :back
#   end  
# end

	
	def create
		secret=Secret.find(params[:secret_id])
		# like=secret.likes.new(user_id:current_user.id)
		likes = Like.new(user:current_user, secret_id:params[:secret_id])
		if likes.valid?
			likes.save
		end
		redirect_to '/secrets'
	end
	
	def destroy
		Secret.find(params[:id]).likes.last.delete
		redirect_to '/secrets'
	end

end

class JoinController < ApplicationController
  before_action :require_login, only: [:create, :destroy]


	def create
		event=Event.find(params[:id])
		# join = Join.new(user:current_user, event_id:params[:event_id])
		join = Join.new(user:current_user, event:event)
		if join.valid?
			join.save
		end
		redirect_to '/event'
	end
	
	def destroy
		join = Join.find(params[:id]).delete
		redirect_to '/event'
	end

end

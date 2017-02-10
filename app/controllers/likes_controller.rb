class LikesController < ApplicationController
  def index
  end

  def new
  end

  def create
    idea=Idea.find(params[:id])  
    if !idea.users_liked.include?(current_user) 
      like = Like.new(user:current_user, idea:idea)
      if like.valid?
        like.save
      end
    end

    
    redirect_to '/bright_ideas'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

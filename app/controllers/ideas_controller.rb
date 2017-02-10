class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.reverse_order
    puts "*****ideas: #{@ideas.inspect}"
  end

  def new
  end

  def create
    idea = Idea.new(description:params[:description], user:current_user)
    puts "**in idea create method**"
    if idea.valid?
      puts "...idea valid"
      idea.save
     
      puts "in idea#create method => idea: #{idea.inspect}"
      redirect_to "/bright_ideas"
    else 
      puts "...idea INVLAID"
      flash[:notice] = idea.errors.full_messages
      for error in flash[:notice]
        puts "error: #{error}"
      end
      redirect_to :back 
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @users = @idea.users_liked

  end

  def edit
  end

  def update
  end

  def destroy
  end
end

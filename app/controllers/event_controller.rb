class EventController < ApplicationController
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

    event = Event.new(event_params)
    event.update(location: location)
    event.update(user: current_user)
    puts "**in event create method**"
    if event.valid?
      puts "...event valid"
      event.save
     
      puts "in event#create method => event: #{event.inspect}"
      redirect_to "/event"
    else 
      puts "...event INVLAID"
      flash[:notice] = event.errors.full_messages
      for error in flash[:notice]
        puts "error: #{error}"
      end
      redirect_to :back 
    end

  end

  def edit
    id = params[:id]
    @event = Event.find(id)    
  end

  def show
    @user=User.find(session[:user_id])
    @events = Event.all
  end

  def update
    event = Event.find(params[:id])
    discussion = Discussion.new(comment:params[:comment], event:event, user:current_user)
    if discussion.valid?
      discussion.save
      puts "*************Comment saved!"
    else
      puts "*************No save!"
     flash[:notice] = discussion.errors.full_messages
     puts flash[:notice]
     for error in flash[:notice]
        puts "error: #{error}"
      end
    end  
    
    @event=Event.find(params[:id])
    redirect_to :back
  end

  def destroy
    puts "***destroying event***"
    id = params[:id]
    Event.find(id).delete
    redirect_to '/event'
  end

  private
    def location_params
       params.require(:location).permit(:city, :state)
    end
    def event_params
      params.require(:event).permit(:description, :date)
    end
end

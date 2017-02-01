class Event < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user
  has_many :discussions


  	validates :description, :date, presence:true  
  	validate :event_date_cannot_be_in_the_past	
 

  def event_date_cannot_be_in_the_past
     errors.add(:date, "of the event cannot be in the past") if date < Date.today
  end

  def find_join_id current_user
    Join.select(:id).where(user: current_user, event: self)[0].id
  end
  
end

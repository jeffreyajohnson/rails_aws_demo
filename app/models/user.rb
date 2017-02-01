class User < ApplicationRecord
  belongs_to :location
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :events
  has_many :discussions
  
  has_secure_password

   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence:true
    validates :first_name, :last_name, length: {minimum: 2}
    validates :email, :presence => true, :format => { :with => EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
    validates :password, length:{minimum:6}
    validates :password_confirmation, presence:true
    before_save do
      self.email.downcase!
    end
end



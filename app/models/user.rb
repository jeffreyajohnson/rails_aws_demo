class User < ApplicationRecord
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  
  has_secure_password
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :name, presence:true
    # validates :password_confirmation, presence:true
    validates :name, length: {minimum: 2}
    validates :password, length: {minimum: 6}
    # validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
    validates :email, :presence => true, :format => { :with => EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
    validates :password, length:{minimum:6}, confirmation: true, on: :create
    # has_secure_password validations: false    
    before_save do
      self.email.downcase!
    end
	
end

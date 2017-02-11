class User < ApplicationRecord
  has_secure_password
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :name, :alias, presence:true
    validates :name, :alias, length: {minimum: 2}
    validates :email, :presence => true, :format => { :with => EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
    validates :password, length:{minimum:6}
    validates :password_confirmation, presence:true
    before_save do
      self.email.downcase!
    end

    def find_user_idea_count (user_id)
      Idea.select(:id).where(user_id:user_id).count
    end
end

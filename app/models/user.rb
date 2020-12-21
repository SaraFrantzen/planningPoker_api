class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :polls, foreign_key: "user_id", class_name: "Poll" 
end
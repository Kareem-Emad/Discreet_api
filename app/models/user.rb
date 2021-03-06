class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_and_belongs_to_many :groups
  has_many :questions
  has_many :answers
end

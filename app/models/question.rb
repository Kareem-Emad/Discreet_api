class Question < ApplicationRecord
	belongs_to :user
	belongs_to :group
	has_many :answers
end

class Question < ApplicationRecord
	belongs_to :user
	belongs_to :group
	has_many :answers

	def self.get_all_questions
		Question.execute_sql("select q.id,q.content,q.votes,q.group_id,q.created_at,q.updated_at,u.name from questions as q,users as u where u.id = q.user_id")
	end
	def self.get_all_questions_for_group g_id
		Question.execute_sql("select q.id,q.content,q.votes,q.group_id,q.created_at,q.updated_at,u.name from questions as q,users as u where u.id = q.user_id and q.group_id=?",g_id)

	end
end

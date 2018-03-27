class Confession < ApplicationRecord
	has_many :confessiontopics
	has_many :topics, through: :confessiontopics
	has_many :comments
	belongs_to :user
	accepts_nested_attributes_for :topics

	def topic_attributes=(topic)
		new_topic = Topic.find_or_create_by(name: topic.name)
		topics << new_topic		
	end
end

class Confession < ApplicationRecord
	has_many :confession_topics
	has_many :topics, through: :confession_topics
	has_many :comments
	belongs_to :user
	# accepts_nested_attributes_for :topics
	accepts_nested_attributes_for :comments, allow_destroy: true

	def topics_attributes=(attributes)
		if !attributes['0'][:name].blank?
			topic = Topic.find_or_create_by(name: attributes['0'][:name])
			topics << topic
		end
	end

end

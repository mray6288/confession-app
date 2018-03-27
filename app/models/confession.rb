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


	def self.longest

	end

	def self.shortest
	end

	def self.most_comments
	end

	def self.alphabetically
	end

	def self.multiple_topics
	end

	def self.most_topics
	end

	def self.longest_title
	end

	def self.shortest_title
	end

	def self.most_recent
	end

	def self.most_recent_5
	end

end

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


	def self.longest_text
		all.order('length(text) desc').limit(1)
	end

	def self.shortest_text
		all.order('length(text)').limit(1)
	end

	def self.most_comments
		joins(:comments).group(:confession_id).order('count(confession_id) desc').limit(1)
	end

	def self.alphabetically_by_title
		all.order(:title)
	end

	def self.multiple_topics
		joins(:confession_topics).group(:confession_id).having('count(confession_id) > 1')
	end

	def self.most_topics
		joins(:confession_topics).group(:confession_id).order('count(confession_id) desc').limit(1)
	end

	def self.longest_title
		all.order('length(title) desc').limit(1)
	end

	def self.shortest_title
		all.order('length(title)').limit(1)
	end

	def self.most_recent
		all.order('id desc').limit(1)
	end

	def self.most_recent_5
		all.order('id desc').limit(5)
	end

end

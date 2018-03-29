class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :confession

	def self.longest_comment
		all.order('length(text) desc').limit(1)
	end

	def self.shortest_comment
		all.order('length(text) asc').limit(1)
	end

	def self.most_recent
		all.limit(1)
	end

	def self.most_recent_5
		all.limit(5)
	end
end

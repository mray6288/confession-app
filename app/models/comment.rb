class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :confession

	def self.longest_comment
	end

	def self.shortest_comment
	end

	def self.most_recent
	end

	def self.most_recent_5
	end
end

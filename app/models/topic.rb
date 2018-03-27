class Topic < ApplicationRecord
	has_many :confession_topics
	has_many :confessions, through: :confession_topics


	def self.most_confessions
	end

	def self.most_comments
	end

	def self.alphabetically
	end
	
end

class Topic < ApplicationRecord
	has_many :confession_topics
	has_many :confessions, through: :confession_topics


	def self.most_confessions
		all.order(:confessions.count).last
	end

	def self.most_comments
		all.order(:comments.count).last
	end

	def self.alphabetically
		all.order(:name)
	end
end

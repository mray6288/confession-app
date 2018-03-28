class Topic < ApplicationRecord
	has_many :confession_topics
	has_many :confessions, through: :confession_topics


	def self.most_confessions
		joins(:confession_topics).group(:confession_id).order('count(topic_id) desc').limit(1)
	end

	def self.with_multiple_topics
  		joins(:confession_topics).group('topic_id').having('count(topic_id) > 1')
	end

	def self.alphabetically
		all.order(:name)
	end
end

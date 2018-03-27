class Topic < ApplicationRecord
	has_many :confession_topics
	has_many :confessions, through: :confession_topics
end

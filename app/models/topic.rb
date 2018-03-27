class Topic < ApplicationRecord
	has_many :confessiontopics
	has_many :confessions, through: :confessiontopics
end

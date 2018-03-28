class User < ApplicationRecord
	has_many :confessions
	has_many :comments
	validates :username, uniqueness: true

	has_secure_password

	def self.most_comments
		joins(:comments).group(:user_id).order('count(user_id) desc').limit(1)
	end

	def self.most_confessions
		joins(:confessions).group(:user_id).order('count(user_id) desc').limit(1)
	end

	def self.longest_username
		all.order('length(username) desc').limit(1)
	end
end

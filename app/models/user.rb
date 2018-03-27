class User < ApplicationRecord
	has_many :confessions
	has_many :comments
	validates :username, uniqueness: true

	has_secure_password

	def self.most_comments
		all.order(:comments.count).last
	end

	def self.most_confessions
		all.order(:confessions.count).last
	end

	def self.longest_username
		all.order(:username.length).last
	end	
end

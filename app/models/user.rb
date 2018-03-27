class User < ApplicationRecord
	has_many :confessions
	has_many :comments
	validates :username, uniqueness: true

	has_secure_password


	def self.most_comments
	end

	def self.most_confessions
	end

	def self.longest_username
	end

	
end

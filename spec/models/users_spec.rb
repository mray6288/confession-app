require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'user analytics' do 
	  it 'should return ray as most confessions' do
	  	expect(User.most_confessions[0]).to eq(@ray)
	  end



	end



  
end
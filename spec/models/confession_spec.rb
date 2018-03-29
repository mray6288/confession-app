require 'rails_helper'

RSpec.describe Confession, type: :model do

	describe 'confession analytics' do
	  it 'should return ray as most confessions' do
	  	expect(Confession.most_comments[0]).to eq(@confession1)
	  end

	end



end

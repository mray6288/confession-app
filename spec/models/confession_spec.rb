require 'rails_helper'

RSpec.describe Confession, type: :model do
  it 'should return ray as most confessions' do
  	expect(Confession.most_confessions).to be(@ray)
  end

  
end

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	let(:joe) {User.create(username: 'Joe', password: '123')}

	describe 'post create' do
		it 'logs you in with the correct password' do
		  post :create, params:{username:joe.username, password:joe.password}
		  expect(session[:user_id]).to eq(joe.id)
		end

		it 'rejects invalid passwords' do
		  post :create, params:{username:joe.username, password:'what'}
		  expect(session[:user_id]).to be_nil
		end

		it 'rejects empty passwords' do
		  post :create, params:{username:joe.username, password: ''}
		  expect(session[:user_id]).to be_nil
		end
	end


end

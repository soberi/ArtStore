require 'rails_helper'

describe UsersController, type: :controller do
	let(:user) { User.create!(first_name: "Bob", last_name: 'Ross', email: "bob@gm.com", password: "pizza123") }
	let(:user2) { User.create!(first_name: "Sipho", last_name: 'Nkosi', email: "sipho@gm.com", password: "pizza546") }

	describe 'GET #show' do
		
		context 'when a user is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do
				get :show, params: { id: user.id }
				expect(assigns(:user)).to eq user
				expect(response).to be_ok
			end

			it 'cannot access other user show page' do
				get :show, params: { id: user2.id }
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :new, params: { id: user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end

	end
end

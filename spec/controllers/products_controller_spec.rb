require 'rails_helper'

describe ProductsController, type: :controller do
	before do
		@product = FactoryBot.create(:product)
		@user_admin = FactoryBot.create(:admin)
	end

	#let(:user) { FactoryBot.create(:user) }
	#let(:admin) { FactoryBot.create(:admin) }
	

	describe 'GET #index' do
		context 'when a user clicks on gallery' do
			it 'loads the product index page' do
				get :index
				expect(response).to be_ok
				expect(response).to render_template('index')
			end
		end
	end

	describe 'GET #show' do
		context 'when a user clicks on a product'	do	
			it 'renders product show page' do
				get :show, params: { id: @product.id }
				expect(response).to be_ok
				expect(assigns(:product)).to eq @product
			end
		end
	end

	describe 'GET #new' do
		context 'if admin clicks on new product' do
			before do
				sign_in @user_admin
				it 'loads the product create form' do
					get :new
					expect(response).to be_ok
					expect(response).to render_template('new')
				end
			end
		end
	end

	describe 'POST #create' do
		context 'when admin submits a new product form' do
			before do
				sign_in @user_admin
				it 'creates a new product if params are valid' do
					post :create, params:{product: {id: @product.id ,name: @product.name, description: @product.description, image_url: @product.image_url, medium: @product.medium, price: @product.price}}
					expect(assigns(:product)).to be_a(Product)
					expect(response).to have_http_status(:created)
				end

				it 'is a valid product' do
        	@product = FactoryBot.build(:product)
        	expect(@product).to be_valid
      	end
      	it 'is an invalid product without name' do
        	@product = FactoryBot.build(:product, name: '')
        	expect(@product).not_to be_valid
      	end
      	it 'is an invalid product without image_url' do
        	@product = FactoryBot.build(:product, image_url: '')
        	expect(@product).not_to be_valid
      	end
      	it 'is an invalid product without price' do
        	@product = FactoryBot.build(:product, price: '')
        	expect(@product).not_to be_valid
      	end
			end
		end
	end

	 describe 'PUT/PATCH #update' do
    it 'updates product params' do
      sign_in @user_admin
      @update = { id: @product_id, name: @product.name, medium: @product.medium, description: @product.description, image_url: @product.image_url,  price: @product.price }
      put :update, params: {id: @product.id, product: @update}
      @product.reload
      expect(@product.name).to eq @product.name
    end
  end

	 describe 'DELETE #destroy' do
	 	context 'if admin clicks delete on product' do
     	it "deletes product" do
#      	@user_admin = FactoryBot.create(:admin)
      	sign_in @user_admin
      	delete :destroy, params: {id: @product.id}
      	expect(response).to redirect_to products_path
      end
    end
  end


end
class OrdersController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource :order

	def index
		#byebug
		if current_user.admin?
			@orders = Order.includes(:product).all 
		else
			@orders = Order.includes(:product, :user).where(user_id: current_user.id).all
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
	end

	def create
	end

	def destroy
	end

end
class ProductsController < ApplicationController
	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to({ action: 'index' }, alert: "Product created successfully")
		else
			redirect_to({ action: 'index' }, alert: "Failed to create Product")
		end
	end
	def index
		@products = Product.all
		@categories = Category.all
	end
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product = Product.find(params[:id])
		@categories = Category.all
	end
	def update
		@product = Product.find(params[:id])
		@product.update_attributes(params[:product])
		render 'show'
	end
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		render 'index'
	end
end
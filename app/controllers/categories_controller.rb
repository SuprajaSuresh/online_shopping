class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end
	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to :back, flash[:notice] => "Category Created Successfully"
		else
			redirect_to :back, flash[:notice] => "Failed to create category"
		end	
	end
	def show
		@category = Category.find(params[:id])
		@products = @category.products.all
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :back, flash[:notice] => "Category Destroyed Successfully"
	end
end

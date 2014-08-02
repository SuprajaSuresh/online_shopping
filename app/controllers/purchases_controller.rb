class PurchasesController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		opts = params[:purchase].merge(:user_id => current_user.id)
		@purchase = @product.purchases.create(opts)
		if @purchase.save(params[:purchase])
			redirect_to :back, :notice => "Successfully purchased"
		end
	end
	def index
		@user = User.find(params[:user_id])
		@purchases = @user.purchases.pending_checkout
		@purchase_array =  @purchases.all.collect{|p| p.id} 
	end

	def checkout_products
		purchased_items = params[:purchase_ids]
		purchased_items.each do |item|
			Purchase.find(item).update_attributes(:checkout => true)
		end
		redirect_to user_path(current_user)
	end
end

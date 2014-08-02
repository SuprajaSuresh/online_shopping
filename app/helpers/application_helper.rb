module ApplicationHelper
	def find_category(product)
		Category.find(product.category_id).name.capitalize
	end
	def find_product(item)
		Product.find(item.product_id).name.capitalize
	end
	def find_price(item)
		Product.find(item.product_id).price
	end
	def format_date(date)
		date.strftime("%d-%m-%Y")
	end
	def format_price(price)
		"Rs. #{price}"
	end
end


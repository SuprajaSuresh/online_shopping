class Purchase < ActiveRecord::Base
	attr_accessible :product_id, :user_id, :checkout

	belongs_to :product
	belongs_to :user

	scope :pending_checkout, where(:checkout => false)
	scope :checkedout, where(:checkout => true)
end

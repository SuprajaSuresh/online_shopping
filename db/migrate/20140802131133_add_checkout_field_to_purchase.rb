class AddCheckoutFieldToPurchase < ActiveRecord::Migration
  def change
  	add_column :purchases, :checkout, :boolean, :default => false
  end
end

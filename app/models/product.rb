class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :category_id
  has_many :purchases
  has_many :users, :through => :purchases


  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true
  validates :category_id, :presence => true
end

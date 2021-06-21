class Product < ApplicationRecord
  belongs_to :bank
  belongs_to :delivery
  belongs_to :category

  has_many :line_items, :dependent => :destroy


  has_one_attached :image
  paginates_per 5



  # ensure that there are no line items referencing this product
 
end

class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  has_many :order_items

  mount_uploader :image_1, ProductImageUploader
  mount_uploader :image_2, ProductImageUploader
  mount_uploader :image_3, ProductImageUploader
  mount_uploader :image_4, ProductImageUploader
  mount_uploader :image_5, ProductImageUploader

  def price_in_dollars
    price / 100
  end
end

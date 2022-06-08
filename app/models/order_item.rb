class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :cart, optional: true

  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end

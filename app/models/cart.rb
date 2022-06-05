class Cart < ApplicationRecord
  has_many :order_items

  # every instance of Cart now has access to this method
  def total_quantity
    @count = 0
    order_items.each do |item|
      @count += item.quantity
    end

    @count
  end
end

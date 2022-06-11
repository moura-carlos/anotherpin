class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :order_items

  # method to move the items from the cart into the order
  def add_from_cart(cart)
    cart.order_items.each do |item|
      self.order_items.new(product: item.product, quantity: item.quantity)
    end
  end

  # method to save order and charge customer using stripe
  def save_and_charge
    # check if submitted information from "new order" form is valid
    # charge in stripe and save order if it is valid.
    # otherwise return false

    # checking if the order itself is valid.
    if self.valid?
      customer = Stripe::Customer.create
      Stripe::Customer.create_source(customer.id, { source: 'tok_visa' }) #self.stripe_token
      Stripe::Charge.create(
        { amount: self.total_price,
          currency: "usd",
          # source: self.stripe_token,
          description: "Order for #{self.email}",
          customer: customer.id
        })
      self.save
    else
      false
    end

    # error handling
  rescue Stripe::CardError => e
    # this is from stripe
    @message = e.json_body[:error][:message]

    # then add to the model errors
    self.errors.add(:stripe_token, @message)

    # return false to our controller
    false
  end
  def total_price
    @total = 0

    order_items.each do |item|
      @total = @total + (item.product.price * item.quantity)
    end

    @total
  end


  def total_price_in_dollars
    @total = 0
    order_items.each do |item|
      @total = @total + (item.product.price_in_dollars *  item.quantity)
    end

    @total
  end


end

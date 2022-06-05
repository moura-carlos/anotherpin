class ApplicationController < ActionController::Base
  # give a user a cart before any action happens
  before_action :current_cart
  # allow the method current_cart to be accessed by the views
  # in our application
  helper_method :current_cart

  def current_cart
    # give a user a new cart upon arrival on the website
    # if customer has just landed on the site, give them a brand new cart.
    # if they already have one, keep it
    # check session[:cart_id]
    if session[:cart_id].present?
      # they already have a cart
      @current_cart = Cart.find(session[:cart_id])
    else
      # they don't have a cart, set one up for them
      @current_cart = Cart.create
      # let the other pages know that we already have a cart set up
      session[:cart_id] = @current_cart.id
    end
  end
end

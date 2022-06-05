class OrderItemsController < ApplicationController
  def create
    # find the product
    @product = Product.find(params[:product_id])
    # cart = @current_cart
    # quantity? - comes from the form data.
    @quantity = form_params[:quantity]
    # add @product to the cart
    @current_cart.order_items.create(product: @product, quantity: @quantity)
    flash[:success] = "#{@product.title} was added to your cart!"
    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:product_id])

    @order_item = OrderItem.find(params[:id])

    @order_item.update(form_params)

    flash[:success] = 'Thank you for updating your cart'

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    flash[:success] = 'The product was successfully removed from the cart!'

    redirect_to cart_path
  end

  private
  def form_params
    params.require(:order_item).permit(:quantity)
  end
end

class OrderMailer < ApplicationMailer

  def receipt(order)
    # assigning order to @other so we can use it in our views.
    @order = order

    mail to: @order.email, subject: 'Thank you for ordering from Another Pin Co.'
  end
end

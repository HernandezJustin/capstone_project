class OrdersController < ApplicationController

  def create
    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: session[:user_id]
      )
    @order.subtotal = @order.order_subtotal
    @order.tax = @order.order_tax
    @order.total = @order.order_total

    @order.save
    render 'create.html.erb'
  end
end

class OrdersController < ApplicationController

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    @order = Order.new(
      user_id: session[:user_id]
      )
    @order.save

    @order.subtotal = @order.order_subtotal
    @order.tax = @order.order_tax
    @order.total = @order.order_total
    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased")
      carted_product.update(order_id: @order.id)
    end
    @order.save
    redirect_to "/orders/#{@order.id}"
  end

  def new
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    @carted_products = @order.carted_products
  end
end

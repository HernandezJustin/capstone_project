class CartedProductsController < ApplicationController
before_action :authenticate_user!

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      if @carted_products.empty?
        flash[:warning] = "Sorry. There are no items in your cart"
        redirect_to "/products"
      else
    render 'index.html.erb'
    end
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    @carted_product = CartedProduct.new(
    user_id: session[:user_id],
    product_id: params[:product_id],
    quantity: params[:quantity],
    status:  "carted"
    )
    @carted_product.save
    redirect_to "/checkout/#{@carted_product.id}"
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: 'removed')
    redirect_to '/checkout'
  end
end

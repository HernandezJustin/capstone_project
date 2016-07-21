class ProductsController < ApplicationController
  def show
    render 'show.html.erb'
  end

  def post
    Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description])
    render 'show.html.erb'
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    @product.save
    flash[:success] = "#{@product.name} has been created successfully"
    redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
    )
    flash[:success] = "#{@product.name} has been updated successfully"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@product.name} has been deleted successfully"
    redirect_to '/products'
  end
end

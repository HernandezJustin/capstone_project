class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort_low_to_high]
      @products = Product.order(:price)
    elsif params[:sort_high_to_low]
      @products = Product.order(price: :desc)
    elsif params[:under_two_dollars]
      @products = Product.where("price < 2")
    end

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
    render 'index.html.erb'
  end

  def show
    if params[:id] == 'Random'
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render 'show.html.erb'
  end

  def new
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
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

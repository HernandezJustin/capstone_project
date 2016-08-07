class Order < ActiveRecord::Base
  has_many :carted_products
  belongs_to :product
  belongs_to :user


  def order_subtotal()
    carted_products = CartedProduct.where(user_id: self.user_id, status: "carted")
    subTotal = 0
    carted_products.each do |cartedProduct|
      subTotal += cartedProduct.product.price * cartedProduct.quantity
    end
    subTotal
  end

  def order_tax
    order_subtotal * 0.09
  end

  def order_total
    order_tax + order_subtotal
  end
end

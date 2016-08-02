class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def order_subtotal
    product.price * quantity
  end

  def order_tax
    order_subtotal * 0.09
  end

  def order_total
    order_tax + order_subtotal
  end
end

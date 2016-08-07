class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  def sale_message
    if price.to_f < 2
      'This item is discounted!'
    else
      'This item is not on sale!'
    end
  end

  def tax
    (price.to_f * 0.09).round(2)
  end

  def total
    (price.to_f + tax).round(2)
  end

  # omitted this method because of belongs_to
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
end

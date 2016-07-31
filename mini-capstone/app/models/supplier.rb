class Supplier < ActiveRecord::Base
  has_many :products

  # omitted this method because of has_many
  # def products
  #   Product.where(supplier_id: id)
  # end
end

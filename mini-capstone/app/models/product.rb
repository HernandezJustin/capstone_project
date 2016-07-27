class Product < ActiveRecord::Base
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
end

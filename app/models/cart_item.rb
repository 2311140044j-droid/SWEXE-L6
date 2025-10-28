class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def subtotal
    unit_price * quantity
  end
end

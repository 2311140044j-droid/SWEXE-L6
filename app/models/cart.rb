class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def total_cents
    cart_items.sum { |ci| ci.unit_price * ci.quantity }
  end

  def total
    total_cents
  end
end
class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    cart_item = current_cart.cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.quantity = (cart_item.quantity || 0) + 1
    cart_item.unit_price = product.price
    cart_item.save!
    redirect_to cart_path, notice: "#{product.name}をカートに追加しました"
  end


  def destroy
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: '商品をカートから削除しました'
  end
end
class ApplicationController < ActionController::Base
  before_action :ensure_cart

  private

  def ensure_cart
    return if session[:cart_id].present? && Cart.exists?(id: session[:cart_id])

    cart = Cart.create!
    session[:cart_id] = cart.id
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create!
    session[:cart_id] = cart.id
    cart
  end

  helper_method :current_cart
end

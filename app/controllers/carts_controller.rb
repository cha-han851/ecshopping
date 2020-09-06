class CartsController < ApplicationController
  before_action :setup_cart_product!, only: [:add_product, :update_product, :delete_product]
  before_action :set_user, only: [:add_product]
  def show
    @cart_products = current_cart.cart_products
  end

  def add_product
    if user_signed_in? && @cart_product.blank?
      @cart = current_cart
      @cart_product = current_cart.cart_products.build(product_id: params[:product_id])
      @cart_product.quantity += params[:quantity].to_i
      @cart_product.save

    elsif !@cart_product.nil?
      @cart_product.quantity += params[:quantity].to_i
      @cart_product.save
    else
      redirect_to ''
    end
  end

  def update_product
    @cart_product.update(quantity: params[:quantity].to_i)
    redirect_to ''
  end

  def delete_product
    @cart_product.destroy
    redirect_to ''
  end

  def setup_cart_product!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end

  private

  def set_user
    @user = current_user
  end
end

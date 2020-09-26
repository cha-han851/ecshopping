class CartsController < ApplicationController
  before_action :setup_cart_product!, only: [:add_product, :update_product, :delete_product,:show]
  before_action :set_user, only: [:add_product]
  before_action :set_product, only: [:add_product]
  before_action :check_user, only: [:show, :add_product]
  
  def show
    @cart_products = current_cart.cart_products

    @sum = 0
  end

  def add_product
    # カートがない場合は新しく作って商品を追加する
    if user_signed_in? && @cart_product.blank?
      @cart = current_cart
      @cart_product = current_cart.cart_products.build(product_id: params[:product_id])
      @cart_product.quantity += params[:quantity].to_i
      @cart_product.save

    elsif !@cart_product.nil?
      @cart_product.quantity += params[:quantity].to_i
      @cart_product.save

    else
      redirect_to root_path
    end
  end

  def update_product
    @cart_product.update(quantity: params[:quantity].to_i)
    redirect_to root_path
  end

  def delete_product
    @cart_products = current_cart.cart_products
    @cart_product = @cart_products.find(params[:id])
    @cart_product.destroy
    if @cart_product == nill
      @cart = current_cart
      @cat.destroy
    else
    redirect_to root_path
    end
  end

  def setup_cart_product!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end

  private

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def check_user
    redirect_to root_path unless user_signed_in?
  end
end

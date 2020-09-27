class OrdersController < ApplicationController
  before_action :order_params
  before_action :set_params
  before_action :setup_cart_product!, only: [:index, :create]

  def index
    # 合計金額を出すための@sumを定義
    @sum = 0
    @cart_products = current_cart.cart_products
    # ログインユーザーであることかつカートに商品がない場合
    if user_signed_in? && @cart_products.nil?
      @cart_product = current_cart.cart_products.build(product_id: params[:product_id])
      @cart_product.quantity += 1
      @cart_product.save
      @order_information = OrderInformation.new

    # ログインユーザーかつカートに商品がある場合
    elsif user_signed_in? && !@cart_products.nil?
      @order_information = OrderInformation.new
      @carts = Cart.all
      @cart = current_cart
      @cart_products = @cart.cart_products

    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      @carts = Cart.all
      # 商品購入後はカートを削除する
      current_cart.destroy

    end
    render action: 'index'
  end

  private

  def setup_cart_product!
    @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building, :price, :phone_number, :product_id, :order_id, :authenticity_token, :total_price, :token).merge(user_id: current_user.id, product_id: params[:product_id], order_id: params[:order_id])
  end

  def price_params
    params.permit(:total_price)
  end

  def set_params
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

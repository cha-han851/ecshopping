class OrdersController < ApplicationController
  before_action :order_params
  before_action :set_params
  # before_action :setup_cart_product!
  def index
    # if  user_signed_in? 
      # && @cart_product.blank?
      @order_information = OrderInformation.new
    # elsif @cart_product == nil!
    # else
      # redirect_to new_user_session_path
    # end
  end


  def create
    @order_information = OrderInformation.new(order_params)

    if @order_information.valid?
      pay_item
      @order_information.save
      return redirect_to root_path
    end
    render 'index'
  end


  private

  # def setup_cart_product!
    # @cart_product = current_cart.cart_products.find_by(product_id: params[:product_id])
  # end
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number,:price,:product_id,:order_id,:authenticity_token, :token).merge(user_id: current_user.id, product_id: params[:product_id],order_id: params[:order_id])
  end
  def set_params
    @product = Product.find(params[:product_id])

  end

  def pay_item
    Payjp.api_key = "sk_test_35279d0f7aa2b621e39b5e38"
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end

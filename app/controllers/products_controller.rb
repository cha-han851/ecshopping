class ProductsController < ApplicationController
  def index
    @products = Product.all.order('created_at DESC')

  end
  def create
    @proucts = Product.new(image_params)
  end
  def show
    set_params
  end

private
def image_params
  params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
end
def set_params
  @product = Product.find(params[:id])
end


end

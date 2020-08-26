class ProductsController < ApplicationController
  def index
    @products = Product.all.order('created_at DESC')
    
  end
  def new
    @product = Product.new
  end
  def create
    @prouct = Product.new(create_params)
    @product.save
  end
  def show
    set_params
  end 
 
private

def set_params
  @product = Product.find(params[:id])
end

def create_params
  params.require(:product).permit(:user_id,:name,:description,:brand,:ship_day, images: [],:tag_list)
end
end

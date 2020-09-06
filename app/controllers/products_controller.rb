class ProductsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def index
    @products = Product.all.order('created_at DESC').includes(:tags)
    @tag_list = Tag.all
    @articles = Article.all
    set_product_column
    set_tag_column
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(create_params)

    if @product.valid?
      @product.save
      return redirect_to root_path
    else
      render 'new'
    end
    @product.save
  end

  def show
    set_params
  end

  def search
    @results = @p
  end

  def set_search
    # 以下は検索に使うときの記述（変数やモデル名は変更してもいいですが
    # ".ransack(params[:q])"はそのままで使用します。）
    @search = Product.ransack(params[:q])

    # 以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
    @p = @search.result
    @products = Product.all
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :brand, :ship_day, :price, :images, :tag_name, images: [])
  end

  def set_params
    @product = Product.find(params[:id])
  end

  def set_product_column
    @product_name = Product.select('name').distinct
    @product_brand = Product.select('brand').distinct
  end

  def set_tag_column
    @tag_name = Tag.select('tag_name').distinct
  end
end

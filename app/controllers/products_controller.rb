class ProductsController < ApplicationController
  before_filter :find_product, :only => [:show, :edit, :update]
  before_filter :find_shop, :only => [:index, :show]
  helper_method :sort_column

  def index
    if @shop
      I18n.locale = @shop.locale
      @products = @shop.products
      render :action => 'shop_index', :layout => 'shop'
    else
      @products = Product.order([sort_column, sort_direction] * ' ')
    end
  end

  # def show

  def new
    @product = Product.new
    @shops = Shop.order(:name)
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_path
    else
      @shops = Shop.order(:name)
      render :action => :new
    end
  end

  def edit
    @shops = Shop.order(:name)
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to products_path
    else
      @shops = Shop.order(:name)
      render :action => :edit
    end
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

  def find_shop
    @shop = Shop.find_by_id(params[:shop_id])
  end

  def sort_column
    super(Product)
  end
end

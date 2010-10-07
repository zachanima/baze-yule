class ProductsController < ApplicationController
  before_filter :find_product, :only => [:show, :edit, :update]

  def index
    @products = Product.order(:name)
  end

  # def show

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_path
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @product.update_attributes(params[:product])
      redirect_to products_path
    else
      render :action => :edit
    end
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end

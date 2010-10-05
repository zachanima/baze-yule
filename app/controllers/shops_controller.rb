class ShopsController < ApplicationController
  before_filter :find_shop, :only => [:show, :edit, :update]

  def index
    @shops = Shop.order(:name)
  end

  # def show

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(params[:shop])

    if @shop.save
      redirect_to shops_path
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @shop.update_attributes(params[:shop])
      redirect_to shops_path
    else
      render :action => :edit
    end
  end

  private
  def find_shop
    @shop = Shop.find(params[:id])
  end
end

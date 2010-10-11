class ShopsController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  before_filter :find_shop, :only => [:show, :edit, :update]
  helper_method :sort_column

  def index
    @shops = Shop.order([sort_column, sort_direction] * ' ')
  end

  def show
    I18n.locale = @shop.locale
    render :layout => 'shop'
  end

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
  def sort_column
    super(Shop)
  end
end

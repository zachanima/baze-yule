class OrdersController < ApplicationController
  before_filter :authenticate_admin, :only => [:index]
  before_filter :certify_user!, :except => [:index]

  def index
    @orders = Order.all
  end

  def show
    render :layout => 'shop'
  end

  def create
    @order = Order.new(params[:order])
    @order.save
    redirect_to @shop
  end
end

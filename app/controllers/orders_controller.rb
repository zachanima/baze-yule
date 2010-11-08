require 'csv'

class OrdersController < ApplicationController
  before_filter :authenticate_admin, :only => [:index]
  before_filter :certify_user!, :except => [:index]

  def index
    if @shop
      users = @shop.users
      products = @shop.products
    else
      users = User.all
      products = Product.all
    end

    @orders = users.collect do |user|
      user.orders.last
    end.flatten.compact.sort do |a, b|
      a.product.name <=> b.product.name
    end

    unique_orders = Hash.new(0)
    
    @orders.collect do |order|
      { :product_id => order.product.id, :option_ids => order.options.collect(&:id) }
    end.each do |order|
      unique_orders.store(order, unique_orders[order] + 1)
    end
      
    @unique_orders = unique_orders.collect do |order|
      { :product => Product.find(order[0][:product_id]),
        :options => Option.find(order[0][:option_ids]),
        :count => order[1] }
    end

    @option_groups_count = products.collect do |product|
      product.option_groups.count > 0 ? product.option_groups.count : nil
    end.compact.max

    respond_to do |format|
      format.html
      format.csv do
        CSV.open('public/all_orders.csv', 'w') do |csv|
          @orders.each do |order|
            row = Array.new
            row << (order.product ? order.product.name : nil)
            row << order.options.collect { |o| [o.option_group.text, o.text].join(': ') }
            ((@option_groups_count || 0) - (order.options.count || 0)).times do
              row << nil
            end
            row << (order.user ? order.user.name : nil)
            csv << row.flatten
          end
        end
        render :file => 'public/all_orders.csv', :layout => false
      end
    end
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

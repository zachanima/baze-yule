require 'csv'

class UsersController < ApplicationController
  before_filter :authenticate_admin
  before_filter :find_user, :only => [:show, :edit, :update]
  helper_method :sort_column

  def index
    if @shop
      @users = @shop.users.sort { |a,b| a.orders.count <=> b.orders.count }
    else
      @users = User.order([sort_column, sort_direction] * ' ')
    end
  end

  # def show

  def new
    @user = User.new
    @shops = Shop.order(:name)
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path
    else
      @shops = Shop.order(:name)
      render :action => :new
    end
  end

  def edit
    @shops = Shop.order(:name)
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      @shops = Shop.order(:name)
      render :action => :edit
    end
  end

  def upload
    @users = CSV.parse(params[:file].read)
    @columns = 0
    @users.each do |user|
      @columns = user.count if user.count > @columns
    end
    @shops = Shop.all
  end

  def import # Needs validation
    fields = params[:fields]
    params[:rows].each do |row|
      user = Hash.new
      user[:shop_id]  = params[:user][:shop_id]
      user[:password] = params[:user][:password]
      params[:attributes][row].each_key do |key|
        unless fields[key].empty?
          if user[fields[key].to_sym].nil?
            user[fields[key].to_sym] = params[:attributes][row][key]
          else
            user[fields[key].to_sym] += "\r\n" + params[:attributes][row][key]
          end
        end
      end
      User.create(user)
    end
    redirect_to users_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def sort_column
    super(User)
  end
end

class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update]
  helper_method :sort_column

  def index
    @users = User.order([sort_column, sort_direction] * ' ')
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

  private
  def find_user
    @user = User.find(params[:id])
  end

  def sort_column
    super(User)
  end
end

class OptionGroupsController < ApplicationController
  before_filter :find_option_group, :only => [:edit, :update]

  def index
    @option_groups = OptionGroup.order(:name)
  end

  def new
    @option_group = OptionGroup.new
    @products = Product.all
  end

  def create
    @option_group = OptionGroup.new(params[:option_group])

    if @option_group.save
      redirect_to option_groups_path
    else
      render :action => :new
    end
  end

  def edit
    @products = Product.all
  end

  def update
    if @option_group.update_attributes(params[:option_group])
      redirect_to option_groups_path
    else
      render :action => :edit
    end
  end

  private
  def find_option_group
    @option_group = OptionGroup.find(params[:id])
  end
end

class OptionGroupsController < ApplicationController
  before_filter :find_option_group, :only => [:edit, :update]
  before_filter :remove_empty_options, :only => [:create, :update]
  helper_method :sort_column

  def index
    @option_groups = OptionGroup.order([sort_column, sort_direction] * ' ')
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
      @products = Product.all
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
      @products = Product.all
      render :action => :edit
    end
  end

  private
  def find_option_group
    @option_group = OptionGroup.find(params[:id])
  end

  def sort_column
    super(OptionGroup, :text)
  end

  def remove_empty_options
    params[:option_group][:options_attributes].each_pair do |key, value|
      if value['text'].blank?
        Option.destroy(value['id']) if value['id']
        params[:option_group][:options_attributes].delete(key)
      end
    end
  end
end

class ProductTemplatesController < ApplicationController
  before_filter :find_product_template, :only => [:show, :edit, :update]

  def index
    @product_templates = ProductTemplate.order(:name)
  end

  # def show

  def new
    @product_template = ProductTemplate.new
  end

  def create
    @product_template = ProductTemplate.new(params[:product_template])

    if @product_template.save
      redirect_to product_templates_path
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @product_template.update_attributes(params[:product_template])
      redirect_to product_templates_path
    else
      render :action => :edit
    end
  end

  private
  def find_product_template
    @product_template = ProductTemplate.find(params[:id])
  end
end

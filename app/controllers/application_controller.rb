class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_direction
  before_filter :find_shop
  before_filter :set_locale
  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'shop' : 'application'
  end

  def set_locale
    if devise_controller?
      I18n.locale = @shop.locale
    end
  end

  private
  def sort_column(klass, default = :name)
    klass.column_names.include?(params[:sort]) ? params[:sort] : default
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : :asc
  end

  def find_shop
    @shop = Shop.find_by_id(params[:shop_id] || params[:id])
  end
end

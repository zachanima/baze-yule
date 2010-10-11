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

  def after_sign_out_path_for(resource)
    shop_path(params[:id])
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
    @shop = Shop.find_by_slug(params[:shop_id] || params[:id]) if @shop.nil?
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |login, password|
      login == 'os' && password == 'secret'
    end
    warden.custom_failure! if performed?
  end
end

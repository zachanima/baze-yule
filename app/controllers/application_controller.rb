class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_direction

  private
  def sort_column(klass, default = :name)
    klass.column_names.include?(params[:sort]) ? params[:sort] : default
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : :asc
  end
end

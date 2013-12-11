class ApplicationController < ActionController::Base
  has_mobile_fu

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  protected

  def set_locale
    session[:locale] = params[:locale] if user_set_available_locale?
    I18n.locale = session[:locale] || http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def user_set_available_locale?
    params[:locale] && params[:locale].in?(I18n.available_locales.map(&:to_s))
  end

  def render_not_found
    render template: "pages/404", status: 404
  end
end


# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  has_mobile_fu

  protect_from_forgery

  before_filter :set_locale

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

  protected

  def set_locale
    if params[:locale] && ["en", "zh_tw"].include?( params[:locale] )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  def render_not_found
    render template: "pages/404", status: 404
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "pls_login"
      redirect_to login_url
    end

  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  def load_follow_user
    @user = User.find_by id: params[:user_id]
    render_404 unless @user
  end

  def render_404
    respond_to do |format|
      format.html{render file: "#{Rails.root}/public/404", layout: false,
        status: :not_found}
      format.xml{head :not_found}
      format.any{head :not_found}
    end
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

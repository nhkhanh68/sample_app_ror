class StaticPagesController < ApplicationController
  def home
    flash[:notice] = t :hello_flash
  end

  def help
  end

  def about
  end

  def contact
  end
end

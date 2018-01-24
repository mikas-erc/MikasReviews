class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def conta_logged_in
    unless logged_in?
      redirect_to  login_path
    end
  end

  def conta_admin
    redirect_to(root_url) unless conta_atual.try(:admin?)
  end



end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def conta_logged_in
    unless logged_in?
      redirect_to  login_path
    end
  end

  def conta_admin

    if current_conta.nil?
      redirect_to(root_url)
  elsif current_conta.tipo != "admin" || "backoffice"
      redirect_to(root_url)
    end


    # redirect_to(root_url) unless current_conta.tipo== "admin" || "backoffice"
  end



end

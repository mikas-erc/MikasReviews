class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def conta_logged_in
    unless logged_in?
      redirect_to  login_path
    end
  end

  def conta_admin
  admin = ["admin","backoffice"]
    if current_conta.nil?
      redirect_to(root_url)
  elsif !admin.include?(current_conta.tipo)
      redirect_to(root_url)
    end
  end

def conta_radmin
  admin = ["admin","backoffice","reviewer"]
    if current_conta.nil?
      redirect_to(root_url)
    elsif !admin.include?(current_conta.tipo)
      redirect_to(root_url)
    end


    # redirect_to(root_url) unless current_conta.tipo== "admin" || "backoffice"
  end



end

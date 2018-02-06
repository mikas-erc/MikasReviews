class AccountActivationsController < ApplicationController

  def edit
    conta = Conta.find_by(email: params[:email])
    if conta && !conta.activated? && conta.authenticated?(:activation, params[:id])
      conta.ativar
      log_in conta
      flash[:success] = "Conta ativada!"
      redirect_to root_url
    else
      flash[:danger] = "Link de ativação invalido"
      redirect_to root_url
    end
  end

end

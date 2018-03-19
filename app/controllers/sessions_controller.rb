class SessionsController < ApplicationController
  def new
  end


  def create

    if conta = Conta.find_by(email: params[:session][:email].downcase).nil?
      conta = Conta.find_by(nickname: params[:session][:email])
    else conta = Conta.find_by(email: params[:session][:email].downcase)
    end

    if conta && conta.authenticate(params[:session][:password])
      if conta.ativo?
        log_in conta
        params[:session][:remember_me] == '1' ? remember(conta) : forget(conta)
        redirect_to conta # alterar mais tarde
      else
        message  = "Conta não ativada. "
        message += "Verifique o seu email para o link de ativação."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Combinação de email/password errada.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

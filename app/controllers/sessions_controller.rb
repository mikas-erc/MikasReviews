class SessionsController < ApplicationController
  def new
  end


  def create
    conta = Conta.find_by(email: params[:session][:email].downcase)
    if conta && conta.authenticate(params[:session][:password])
      log_in conta
      params[:session][:remember_me] == '1' ? remember(conta) : forget(conta)
      redirect_to conta # alterar mais tarde
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

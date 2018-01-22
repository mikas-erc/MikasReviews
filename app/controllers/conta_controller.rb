class ContaController < ApplicationController

  def show
    @conta = Conta.find(params[:id])
  end

  def index
    @contas = Conta.all
  end

  def view
  end

  def create
  @conta = Conta.new(conta_params)
    if @conta.save
      log_in @conta
      flash[:info] = "Por favor verifique o seu email para ativar a sua conta"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @conta= Conta.new
  end



  def conta_params
  params.require(:conta).permit(:name, :email, :password,
                               :password_confirmation)
  end
end

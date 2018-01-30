class FrontofficeController < ApplicationController
  def index
  end

  def jogos_index
    @jogos = Jogo.all
  end

  def noticias_index
    @noticias = Noticium.all
  end

  def contas_index
    @contas = Conta.all
  end

  def create_conta
  @conta = Conta.new(conta_params)
    if @conta.save
      log_in @conta
      flash[:info] = "Por favor verifique o seu email para ativar a sua conta"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new_conta
    @conta= Conta.new
  end



  def conta_params
  params.require(:conta).permit(:nome, :email, :password,
                               :password_confirmation, :tipo)
  end

end

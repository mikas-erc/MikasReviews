class FrontofficeController < ApplicationController
  def index
    @ultimas_noticias = Noticium.last(3).to_a.reverse
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
      @conta.mandar_ativacao_email
      flash[:info] = "Por favor verifique o seu email para ativar a sua conta."
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

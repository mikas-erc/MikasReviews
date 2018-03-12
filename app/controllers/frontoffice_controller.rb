class FrontofficeController < ApplicationController
  before_action :conta_logged_in, only: [:edit_conta, :edit_contapw, :update_conta]
  before_action :conta_correcta, only: [:edit_conta, :edit_contapw, :update_conta]


  def index
    @ultimas_noticias = Noticium.last(3).to_a.reverse
  end

  def settings
  end

  def view_noticia
    @noticia = Noticium.find(params[:id])
  end

  def view_jogo
    @jogo = Jogo.find(params[:id])
  end

  def view_conta
    @conta = Conta.find(params[:id])
  end

  def jogos_index
    @jogos = Jogo.all
  end

  def noticias_index
    @noticias = Noticium.all
  end

  def contas_index
    @contas = Conta.all.where.not(tipo:"empresa")
  end

  def empresas_index
    @contas = Conta.all.where(tipo:"empresa")
  end

  def create_conta
  @conta = Conta.new(conta_params)
    if @conta.save
      @conta.mandar_ativacao_email
      flash[:info] = "Por favor verifique o seu email para ativar a sua conta."
      redirect_to root_url
    else
      render 'new_conta'
    end
  end

  def new_conta
    @conta= Conta.new
  end

  def edit_conta
    @conta = Conta.find(params[:id])
  end

  def update_conta
    @conta = Conta.find(params[:id])

      if @conta.update_attributes(conta_params)
        redirect_to @conta
      else
        render 'edit_conta'
      end
  end



  def conta_params
  params.require(:conta).permit(:nome, :email, :password,
                               :password_confirmation, :tipo)
  end

  def conta_correcta
  @conta = Conta.find(params[:id])
  redirect_to(root_url) unless conta_atual?(@conta)
  end

end

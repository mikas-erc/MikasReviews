class FrontofficeController < ApplicationController
  before_action :conta_logged_in, only: [:edit_conta, :edit_contapw, :update_conta]
  before_action :conta_correcta, only: [:edit_conta, :edit_contapw, :update_conta]


  def index
    @ultimas_noticias = Noticium.where(ativo:true).last(5).to_a.reverse
    @ultimos_jogos = Jogo.where("data_de_lancamento >= ?",Time.zone.today).order("data_de_lancamento DESC").last(3)
    @ultimas_reviews = Review.last(3).to_a.reverse
  end

  def settings
  end

  def view_noticia
    @noticia = Noticium.find(params[:id])
    if !@noticia.ativo?
      redirect_to root_path
    end
    @ntags = @noticia.tags.split(',')
    @ntags.each do |n|
      if @noticiasmesmotipo.nil?
        @noticiasmesmotipo = Noticium.searchtipo(n).where.not(id:@noticia.id).shuffle.last(3)
      end
    end
  end

  def view_jogo
    @jogo = Jogo.find(params[:id])
    @jtags = @jogo.tags.split(',')
    @reviews = Review.where(jogo_id:@jogo.id).paginate(page: params[:page], per_page: 10)
    @jtags.each do |n|
     if @jogosmesmotipo.nil?
       @jogosmesmotipo = Jogo.searchtipo(n).where.not(id:@jogo.id).shuffle.last(3)
     end
   end
  end

  def view_conta
    @conta = Conta.find(params[:id])
  end

  def jogos_index
    @jogos = Jogo.all.paginate(page: params[:page], per_page: 10)
  end

  def noticias_index
    @noticias = Noticium.where(ativo:true).paginate(page: params[:page], per_page: 10)
  end

  def contas_index
    @contas = Conta.all.where.not(tipo:"empresa").where(ativo:true).paginate(page: params[:page], per_page: 33)
  end

  def empresas_index
    @contas = Conta.all.where(tipo:"empresa").where(ativo:true).paginate(page: params[:page], per_page: 33)
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
                               :password_confirmation, :tipo, :nickname, :foto, :newsletter, :verificado)
  end

  def conta_correcta
  @conta = Conta.find(params[:id])
  redirect_to(root_url) unless conta_atual?(@conta)
  end

end

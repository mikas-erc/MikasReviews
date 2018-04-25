class JogoController < ApplicationController
 before_action :conta_admin
 layout 'backoffice'

  def view
  end

  def index
    @jogos = Jogo.all

  end

  def create
  @jogo = Jogo.new(jogo_params)
  @jogo.steam=0
  @jogo.idsteam=0
    if @jogo.save
      flash[:info] = "Jogo adicionado com sucesso!"
      redirect_to jogo_index_path
    else
      render 'new'
    end
  end

  def create
  @jogo = Jogo.new(jogo_params)
  @jogo.steam=0
  @jogo.idsteam=0
    if @jogo.save
      flash[:info] = "Jogo adicionado com sucesso!"
      redirect_to jogo_index_path
    else
      flash[:info] = @jogo.errors.full_messages
      render 'new'
    end
  end


  def show
    @jogo = Jogo.find(params[:id])
  end

  def edit
    @jogo = Jogo.find(params[:id])
  end

  def update
    @jogo = Jogo.find(params[:id])

      if @jogo.update_attributes(jogo_params)
        redirect_to @jogo
      else
        render 'edit'
      end
  end

  def destroy
    @jogo = Jogo.find(params[:id]).destroy
    flash[:success] = "O Jogo '" + @jogo.nome + "' foi eliminado com sucesso"
    redirect_to jogo_index_path
  end

  def new
    @jogo= Jogo.new
  end

  def steam
    @jogo = Jogo.new
  end

  def news
    @jogo = Jogo.new
    steam = JSON.load(open("http://store.steampowered.com/api/appdetails?appids=#{params[:id]}"))

      @jogo.descricao = steam["#{params[:id]}"]['data']['about_the_game']
      @jogo.preco = steam["#{params[:id]}"]['data']['price_overview']['initial'] * 0.01
      @jogo.remote_foto_url = steam["#{params[:id]}"]['data']['header_image']
      @jogo.developer = steam["#{params[:id]}"]['data']['developers']
      @jogo.nome = steam["#{params[:id]}"]['data']['name']
      @jogo.data_de_lancamento = steam["#{params[:id]}"]['data']['release_date']['date']

    respond_to do |format|
      format.html { redirect_to new_jogo_path }
      format.js
    end
  end

  def jogo_params
  params.require(:jogo).permit(:nome, :preco, :descricao, :developer, :idsteam, :steam, :data_de_lancamento, :tags, :foto)

  end


end

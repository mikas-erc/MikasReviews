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
    if @jogo.save
      flash[:info] = "Jogo adicionado com sucesso!"
      redirect_to jogo_index_path
    else
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

  def jogo_params
  params.require(:jogo).permit(:nome, :preco, :descricao, :developer, :idsteam, :steam, :data_de_lancamento, :tags)

  end


end

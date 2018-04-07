class SearchController < ApplicationController

  def index
    @teste = params[:search]
       if params[:search] && !params[:search].blank?
         @contas = Conta.where.not(tipo:"empresa").search(params[:search]).paginate(page: params[:contas_page], per_page: 12)
         @empresas = Conta.where(tipo:"empresa").search(params[:search]).paginate(page: params[:empresas_page], per_page: 12)
         @jogos = Jogo.search(params[:search]).paginate(page: params[:jogos_page], per_page: 6)
         @noticias = Noticium.search(params[:search]).paginate(page: params[:noticias_page], per_page: 6)
       end
  end

  def searchtipon
    @id = params[:id]
    @noticias = Noticium.searchtipo(@id).paginate(page: params[:noticias_page], per_page: 6)
  end

  def searchtipoj
    @id = params[:id]
    @jogos = Jogo.searchtipo(@id).paginate(page: params[:jogos_page], per_page: 6)
  end

end

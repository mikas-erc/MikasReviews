class NoticiaController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'

    def view
    end


    def index
      @noticias = Noticium.all
    end

    def create
    @noticia = Noticium.new(noticia_params)
      if @noticia.save
        flash[:info] = "Noticia adicionada com sucesso!"
        redirect_to noticia_path
      else
        render 'new'
      end
    end


    def show
      @noticia = Noticium.find(params[:id])
    end

    def edit
      @noticia = Noticium.find(params[:id])
    end

    def update
      @noticia = Noticium.find(params[:id])

        if @noticia.update_attributes(noticia_params)
          redirect_to @noticia
        else
          render 'edit'
        end
    end

    def destroy
      @noticia = Noticium.find(params[:id]).destroy
      flash[:success] = "A noticia '" + @noticia.nome + "' foi eliminado com sucesso"
      redirect_to noticia_path
    end

    def new
      @noticia= Noticium.new
    end

    def noticia_params
    params.require(:noticium).permit(:nome,:descricao, :texto, :data, :foto, :tags) 

    end

end

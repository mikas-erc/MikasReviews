class NoticiaController < ApplicationController
  before_action :conta_admin, except: [:create,:new,:show]
  before_action :conta_radmin, only: [:create,:new,:show]
  layout 'backoffice'

    def view
    end


    def index
      @noticias = Noticium.all.paginate(page: params[:page], per_page: 30)
    end

    def create
    @noticia = Noticium.new(noticia_params)
    @noticia.ativo=false
    @noticia.conta=current_conta
      if @noticia.save
        flash[:info] = "Noticia adicionada com sucesso!"
        redirect_to noticia_path
      else
        render 'new'
      end
    end

    def aprovar
      @noticia = Noticium.find(params[:id])
      @noticia.update_attribute(:ativo,true)
      redirect_to view_noticia_path(@noticia)
    end

    def desaprovar
      @noticia = Noticium.find(params[:id]).destroy
      redirect_to aprovarindex_path
    end

    def aprovarindex
      @noticias = Noticium.where(ativo:false)
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
    params.require(:noticium).permit(:nome,:descricao, :texto, :data, :foto,  :ativo, :tags)

    end

end

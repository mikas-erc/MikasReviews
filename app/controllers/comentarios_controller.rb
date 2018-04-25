class ComentariosController < ApplicationController

before_action :conta_correcta, only: [:destroy]


  def addconta
    @comentario = Comentario.new(comentario_params)
    @comentario.tipo = 'conta'
    @comentario.conta_id = current_conta.id
    if @comentario.save
      @comentarios = Comentario.where(tipo:'conta',tipoid:@comentario.tipoid).paginate(page: params[:comentarios_page], per_page: 15).reverse_order
      respond_to do |format|
        format.html { redirect_to view_conta_path(@comentario.tipoid) }
        format.js
      end
    else
      redirect_to view_conta_path(@comentario.tipoid)
    end
  end

  def destroy

    @comentario = Comentario.find(params[:id])
    @comentario.destroy

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
  end

  def addnoticia
    @comentario = Comentario.new(comentario_params)
    @comentario.tipo = 'noticia'
    @comentario.conta_id = current_conta.id
    if @comentario.save
      @comentarios = Comentario.where(tipo:'noticia',tipoid:@comentario.tipoid).paginate(page: params[:comentarios_page], per_page: 15).reverse_order
      respond_to do |format|
        format.html { redirect_to view_noticia_path(@comentario.tipoid) }
        format.js
      end
    else
      redirect_to view_noticia_path(@comentario.tipoid)
    end
  end

  def addjogo
    @comentario = Comentario.new(comentario_params)
    @comentario.tipo = 'jogo'
    @comentario.conta_id = current_conta.id
    if @comentario.save
      @comentarios = Comentario.where(tipo:'jogo',tipoid:@comentario.tipoid).paginate(page: params[:comentarios_page], per_page: 15).reverse_order
      respond_to do |format|
        format.html { redirect_to view_jogo_path(@comentario.tipoid) }
        format.js
      end
    else
      redirect_to view_jogo_path(@comentario.tipoid)
    end
  end




  def comentario_params
    params.require(:comentario).permit(:tipoid, :texto)
  end

  def conta_correcta
    admin = ['admin','backoffice']
  @conta = Conta.find(Comentario.find(params[:id]).conta_id)
    if !admin.include?(current_conta.tipo)
      redirect_to(root_url) unless conta_atual?(@conta)
    end
  end

end

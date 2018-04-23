class SeguidosController < ApplicationController

  def add
    @conta = Conta.find(params[:id])
    if(!Seguido.where(idseguidor:current_conta.id,idseguido:@conta.id).any?)
      Seguido.new(idseguidor:current_conta.id,idseguido:@conta.id).save
    end
    respond_to do |format|
      format.html { redirect_to view_conta_path(@conta) }
      format.js
    end
  end

  def delete
    @conta = Conta.find(params[:id])
    if(Seguido.where(idseguidor:current_conta.id,idseguido:@conta.id).any?)
      Seguido.find_by(idseguidor:current_conta.id,idseguido:@conta.id).destroy
    end
      respond_to do |format|
        format.html { redirect_to view_conta_path(@conta) }
        format.js
      end
  end

end

class SeguidosController < ApplicationController

  def add
    if(!Seguidos.find_by(idseguidor:current_conta.id,idseguido:params[:id]))
      Seguidos.create(idseguidor:current_conta.id,idseguido:params[:id]).save
    end

  end

  def delete
    if(Seguidos.find_by(idseguidor:current_conta.id,idseguido:params[:id]))
      Seguidos.find_by(idseguidor:current_conta.id,idseguido:params[:id]).destroy
    end

  end

end

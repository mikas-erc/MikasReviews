class FrontofficeController < ApplicationController
  def index
  end

  def jogos_index
    @jogos = Jogo.all
  end

end

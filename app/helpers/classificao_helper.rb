module ClassificaoHelper


  def classtotal(jogo)
    Classificacao.where(jogo_id:jogo.id).sum(:classificacao)
  end

end

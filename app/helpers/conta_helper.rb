module ContaHelper

  def upvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:1).any?
  end

  def downvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:-1).any?
  end

end

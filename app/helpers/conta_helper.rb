module ContaHelper

  def upvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:1).any?
  end

  def segue?(conta)
    Seguido.where(idseguidor:current_conta.id,idseguido:conta.id).any?
  end

  def downvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:-1).any?
  end

end

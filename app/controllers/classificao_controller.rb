class ClassificaoController < ApplicationController

  before_action :logged_in?

  def upvote
      @jogo = Jogo.find(params[:id])
      if upvoted?(@jogo,current_conta)
        Classificacao.find_by(jogo_id:@jogo.id,conta_id:current_conta.id).destroy
      else
        if downvoted?(@jogo,current_conta)
          Classificacao.find_by(jogo_id:@jogo.id,conta_id:current_conta.id).update_attribute(:classificacao, 1)
        else
          Classificacao.new(classificacao:1,jogo_id:@jogo.id,conta_id:current_conta.id).save
        end
      end
      respond_to do |format|
        format.html { redirect_to view_jogo_path(@jogo) }
        format.js
      end
  end

  def downvote
      @jogo = Jogo.find(params[:id])
      if downvoted?(@jogo,current_conta)
        Classificacao.find_by(jogo_id:@jogo.id,conta_id:current_conta.id).destroy
      else
        if upvoted?(@jogo,current_conta)
          Classificacao.find_by(jogo_id:@jogo.id,conta_id:current_conta.id).update_attribute(:classificacao, -1)
        else
          Classificacao.new(classificacao:'-1',jogo_id:@jogo.id,conta_id:current_conta.id).save
        end
      end
      respond_to do |format|
        format.html { redirect_to view_jogo_path(@jogo) }
        format.js
      end
  end

  private


  def classtotal(jogo)
    Classificacao.where(jogo_id:jogo.id).sum(:classificacao)
  end

  def upvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:1).any?
  end

  def downvoted?(jogo,conta)
    Classificacao.where(conta_id:conta.id,jogo_id:jogo.id,classificacao:-1).any?
  end

end

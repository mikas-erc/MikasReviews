class Newsletter < ApplicationRecord

  def self.newsletter
    @noticias=Noticium.all.where(novo:true)
    Conta.where(newsletter:true).each do |conta|
      ContaMailer.newsletter(conta).deliver_now
    end
    @noticias.each do |n|
        n.update_attribute(:novo, false)
    end
  end

end

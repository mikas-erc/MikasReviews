class Jogo < ApplicationRecord
  mount_uploader :foto, FotoUploader
  validates :foto, presence:true, allow_blank:false
  validates :nome, presence: true, length: { maximum: 50 }

  def self.search(search)
    search=search.downcase.gsub(/\s+/, "%")
    where("LOWER(nome) LIKE ? ", "%#{search}%")
  end


end

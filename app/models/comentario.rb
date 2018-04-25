class Comentario < ApplicationRecord

  validates :texto, presence:true, allow_blank:false

end

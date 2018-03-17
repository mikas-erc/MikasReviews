class Noticium < ApplicationRecord
  mount_uploader :foto, FotoUploader
  validates :foto, presence:true, allow_blank:false
  validates :nome, presence: true, length: { maximum: 50 }

end

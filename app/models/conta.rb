class Conta < ApplicationRecord
  attr_accessor :remember_token, :ativo_token
  before_save { self.email = email.downcase }
  before_save :criar_ativo_digest
  mount_uploader :foto, AvatarUploader
  validates :foto, presence:true, allow_blank:false
  validates :nome, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, length: { maximum: 30 },uniqueness: { case_sensitive: false },format: { with: /\A[a-zA-Z0-9]+\Z/ }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :update, allow_blank: true;

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Conta.new_token
    update_attribute(:remember_digest, Conta.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def criar_ativo_digest
    self.ativo_token = Conta.new_token
    self.ativo_digest = Conta.digest(ativo_token)
  end

  def ativar
    update_attribute(:ativo,    true)
    update_attribute(:ativado_em, Time.zone.now)
  end

  def mandar_ativacao_email
    ContaMailer.account_activation(self).deliver_now
  end


  def forget
    update_attribute(:remember_digest, nil)
  end
end

class Conta < ApplicationRecord
  attr_accessor :remember_token, :ativo_token
  before_save { self.email = email.downcase }
  before_save :criar_ativo_digest

  validates :nome, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

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

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def criar_ativo_digest
    self.ativo_token = Conta.new_token
    self.ativo_digest = Conta.digest(ativo_token)
  end


  def forget
    update_attribute(:remember_digest, nil)
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/conta_mailer
class ContaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/conta_mailer/account_activation
  def account_activation
    conta=Conta.first
    user.ativo_token = Conta.new_token
    ContaMailer.account_activation(conta)
  end

  # Preview this email at http://localhost:3000/rails/mailers/conta_mailer/password_reset
  def password_reset
    ContaMailer.password_reset
  end

end

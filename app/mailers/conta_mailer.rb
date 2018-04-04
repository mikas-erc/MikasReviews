class ContaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.conta_mailer.account_activation.subject
  #
  def account_activation(conta)
    @conta = conta
    mail to: conta.email, subject: "Ativação da conta da MikasReviews"

  end

  def newsletter(conta)
    @conta = conta
    mail to: conta.email, subject: "Newsletter da MikasReviews"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.conta_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

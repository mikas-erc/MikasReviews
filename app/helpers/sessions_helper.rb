module SessionsHelper

  # Logs in the given conta.
  def log_in(conta)
    session[:conta_id] = conta.id
  end

  def current_conta
    @current_conta ||= Conta.find_by(id: session[:conta_id])
  end

  def logged_in?
    !@current_conta.nil?
  end

  def log_out
    session.delete(:conta_id)
    @current_conta = nil
  end

end

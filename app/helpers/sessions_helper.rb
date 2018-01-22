module SessionsHelper

  # Logs in the given conta.
  def log_in(conta)
    session[:conta_id] = conta.id
  end

  def remember(conta)
    conta.remember
    cookies.permanent.signed[:conta_id] = conta.id
    cookies.permanent[:remember_token] = conta.remember_token
  end


  def current_conta
    if (conta_id = session[:conta_id])
  @current_conta ||= Conta.find_by(id: conta_id)
elsif (conta_id = cookies.signed[:conta_id])
  conta = Conta.find_by(id: conta_id)
  if conta && conta.authenticated?(cookies[:remember_token])
    log_in conta
    @current_conta = conta
  end
end

  end

  def logged_in?
    !@current_conta.nil?
  end

  def forget(conta)
    conta.forget
    cookies.delete(:conta_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_conta)
    session.delete(:conta_id)
    @current_conta = nil
  end

end

class ContaController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'

  def show
    @conta = Conta.find(params[:id])
  end

  def index
    @contas = Conta.all
  end

  def view
  end

  def create
  @conta = Conta.new(conta_params)
    if @conta.save
      redirect_to conta_path
    else
      render 'new'
    end
  end

  def new
    @conta= Conta.new
  end

  def destroy
  @conta = Conta.find(params[:id])
    if (@conta != current_conta) && (@conta.tipo!=current_conta.tipo) && (@conta.tipo!="backoffice")
      @conta.destroy
      flash[:success] = "A conta '" + @conta.nome + "' foi eliminado com sucesso"
      redirect_to conta_path
    else
      flash[:warning] = "Não tem permissões para apagar esta conta!"
      redirect_to conta_path
    end
  end

  def edit
    @conta = Conta.find(params[:id])
  end

  def edit_password
    @conta = Conta.find(params[:id])
  end

  def update_password
    @conta = Conta.find(params[:id])
      if @conta.update_attributes(conta_params)
        redirect_to @conta
      else
        render 'edit_password'
      end
  end

  def update
    @conta = Conta.find(params[:id])

      if @conta.update_attributes(conta_params)
        redirect_to @conta
      else
        render 'edit'
      end
  end


  def conta_params
  params.require(:conta).permit(:nome, :email, :password,
                               :password_confirmation, :tipo, :nickname, :foto, :verificado, :newsletter, :ativo)
  end
end

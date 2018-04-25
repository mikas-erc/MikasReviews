class ContaController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'


  def show
    @conta = Conta.find(params[:id])
  end

  def index
    @contas = Conta.all.paginate(page: params[:page], per_page: 25)
  end

  def view
  end

  def create
  admin = ["admin","backoffice"]
  @conta = Conta.new(conta_params)
    if @conta.tipo != "backoffice"
      if @conta.tipo != "admin" && (admin.include?(current_conta.tipo))
        if @conta.save
          redirect_to conta_path
        else
          render 'new'
        end
      elsif (@conta == current_conta) || (current_conta.tipo=="backoffice")
        if @conta.save
          redirect_to conta_path
        else
          render 'new'
        end
      else
        message = "Você não tem permissão para adicionar administradores."
        flash.now[:warning] = message
        render 'new'
      end
    else
      message = "Você não tem permissão para adicionar backoffice."
      flash.now[:warning] = message
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
    admin = ["admin","backoffice"]
    @conta = Conta.find(params[:id])
    if conta_params[:tipo] != "backoffice"
      if (conta_params[:tipo] != "admin") && (admin.include?(current_conta.tipo))
        if @conta.update_attributes(conta_params)
          redirect_to @conta
        else
          render 'edit'
        end
      elsif (@conta == current_conta) || (current_conta.tipo=="backoffice")
        if @conta.update_attributes(conta_params)
          redirect_to @conta
        else
          render 'edit'
        end
      else
        message = "Você não tem permissão para editar administradores."
        flash.now[:warning] = message
        render 'new'
      end
    else
      message = "Você não tem permissão para editar backoffice."
      flash.now[:warning] = message
      render 'new'
    end
      # if conta_params[:tipo] != "backoffice"
      #   if conta_params[:tipo] == "admin" && current_conta.tipo == "backoffice"
      #     if @conta.update_attributes(conta_params)
      #       redirect_to conta_path
      #     else
      #       render 'edit'
      #     end
      #   else
      #     message = "Você não tem permissão para editar administradores."
      #     flash.now[:warning] = message
      #     render 'new'
      #   end
      # else
      #   message = "Você não tem permissão para editar backoffice."
      #   flash.now[:warning] = message
      #   render 'new'
      # end
  end


  def conta_params
  params.require(:conta).permit(:nome, :email, :password,
                               :password_confirmation, :tipo, :nickname, :foto, :verificado, :newsletter, :ativo)
  end
end

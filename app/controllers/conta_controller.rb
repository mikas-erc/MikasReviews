class ContaController < ApplicationController

  def show
    @conta = Conta.find(params[:id])
  end

  def new
    @contanova = Conta.new
  end

  def index
    @contas = Conta.all
  end

  def view
  end

  def create
  @conta = Conta.new(params[:conta])    # Not the final implementation!
    if @conta.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def conta_params
  params.require(:conta).permit(:name, :email, :password,
                               :password_confirmation)
  end
end

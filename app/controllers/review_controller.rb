class ReviewController < ApplicationController
  before_action :conta_admin, except: [:create,:new,:show]
  before_action :conta_radmin, only: [:create,:new,:show]



  def view
  end


  def create
    @review = Review.new(review_params)
    @review.conta=current_conta
    @review.jogo_id = params[:jogo_id]
    if @review.save
     flash[:info]= "Review adicionada com sucesso!"
     redirect_to view_jogo_path(@review.jogo_id)
   else
     render 'new'
   end
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    flash[:sucess] = "A review foi eliminada."
    redirect_to jogo_path(@review.jogo_id)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to jogo_path(@review.jogo_id)
    else
      render 'edit'
    end
  end

  def review_params
  params.require(:review).permit(:texto,:classificacao)
  end


end

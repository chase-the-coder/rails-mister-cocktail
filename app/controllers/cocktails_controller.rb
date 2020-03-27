class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @cocktails = policy_scope(Cocktail.search_by_name(params[:query]))
    else
      @cocktails = policy_scope(Cocktail.all)
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    authorize @cocktail
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end
end

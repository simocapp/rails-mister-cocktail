class CocktailsController < ApplicationController
  #resources :cocktails, only: [:index, :show, :new, :create] do
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # A user can see the details of a given cocktail, with the dose needed for each ingredient
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

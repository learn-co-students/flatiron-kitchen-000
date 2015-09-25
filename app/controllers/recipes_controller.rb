class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe has been created."
    else
      flash[:alert] = "Recipe has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe has been updated."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been updated."
      render "edit"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredient_attributes => [:name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end

class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.create(post_params)
    checked_ingredients = params[:recipe][:ingredient_ids]
    checked_ingredients.each do |ingre|
      if ingre.length != 0
        @recipe.ingredients << (Ingredient.find(ingre))
      end
    end
    @recipe.save
  end

  def destroy
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients.clear
    checked_ingredients = params[:recipe][:ingredient_ids]
    checked_ingredients.each do |ingre|
      if ingre.length != 0
        @recipe.ingredients << (Ingredient.find(ingre))
      end
    end
    @recipe.update(post_params)
  end

  private

  def post_params
      params.require(:recipe).permit(:name)
  end

end
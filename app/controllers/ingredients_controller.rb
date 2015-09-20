class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def index

  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.create(post_params)
    @ingredient.save
  end

  def destroy
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(post_params)
  end

  private

  def post_params
      params.require(:ingredient).permit(:name)
  end

end
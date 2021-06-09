class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :neme,
      :time,
      materials_attributes: [:name, :quantity],
      photos_attributes: :image_id,
      makes_attributes: :method
      )
  end

end

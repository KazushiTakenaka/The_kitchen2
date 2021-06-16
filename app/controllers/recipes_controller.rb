class RecipesController < ApplicationController
  before_action :authenticate_user!
# require './app/fomes/recipes_form.rb'

  def new
    # @recipe_form = RecipeForm.new
    @recipe = Recipe.new
    @recipe.materials.build
    @recipe.photos.build
    @recipe.makes.build
  end

  def create
    # @recipe_form = RecipeForm.new(recipe_params)
    # @recipe_form.user_id = current_user.id
    # @recipe_form.save
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :time,
      :user_id,
      materials_attributes: [:id,:name, :quantity, :_destroy],
      photos_attributes: [:id, :image, :_destroy],
      makes_attributes: [:id, :method, :_destroy]
      )
  end

end

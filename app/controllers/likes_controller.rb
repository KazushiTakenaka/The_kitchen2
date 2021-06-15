class LikesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @like = Like.new
    @like.user_id = current_user.id
    @like.recipe_id = @recipe.id
    @like.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @like = current_user.likes.find_by(recipe_id: @recipe.id)
    @like.user_id = current_user.id
    @like.destroy
    redirect_to recipe_path(@recipe)
  end

  def index

    @likes = current_user.likes.page(params[:page])

    # @recipes = Like.page(params[:page])
  end

end

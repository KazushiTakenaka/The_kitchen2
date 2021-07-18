class HomesController < ApplicationController

  def top
    @recipes = Recipe.all.order(id: "DESC").page(params[:page])
    @recipes_rank = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
end

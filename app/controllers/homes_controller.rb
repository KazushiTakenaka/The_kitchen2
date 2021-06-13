class HomesController < ApplicationController
  
  def top
    @recipes = Recipe.page(params[:page])
    #@recipes = Recipe.order('ex_point DESC').limit(20).includes("last_treasure").page(params[:page]).per(6)
  end
end

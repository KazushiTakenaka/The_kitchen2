class HomesController < ApplicationController
  
  def top
    @recipes = Recipe.page(params[:page]).per(6)
  end
end

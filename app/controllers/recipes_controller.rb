class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    @recipe.materials.build
    @recipe.photos.build
    @recipe.makes.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else #lash[:error] = "空欄があります"
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @tags = @recipe.tag_counts_on(:tags)  #投稿に紐付くタグの表示
    @post = Post.new
    @posts = @recipe.posts
    @average_star = []
    @posts.each do |pos|
      @average_star.push(pos.star)
    end
    @average = @average_star.sum.fdiv(@average_star.length)
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to list_path(current_user)
  end
  
  def tags
    @recipes = Recipe.tagged_with(params[:tag]).page(params[:page])
  end

  def search
    if params[:name].present?
      @recipes = Recipe.where('name LIKE ?', "%#{params[:name]}%").page(params[:page])
    else
      @recipes = Recipe.none
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :time,
      :user_id,
      :tag_list,
      materials_attributes: [:id,:name, :quantity, :_destroy],
      photos_attributes: [:id, :image, :_destroy],
      makes_attributes: [:id, :method, :_destroy]
      )
  end

end

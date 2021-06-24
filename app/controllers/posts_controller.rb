class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @post = Post.new(post_params)
    @post.recipe_id = @recipe.id
    @post.user_id = current_user.id
    if @post.save
    redirect_to recipe_path(@recipe)
    else flash[:error] = "星レビューを入力してください!!"
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to recipe_path(@post.recipe.id)
  end

  def post_params
   params.require(:post).permit(:comment, :star)
  end

end

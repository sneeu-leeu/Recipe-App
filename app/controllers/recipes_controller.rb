class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @new_recipe = current_user.recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Recipe successfully created'
      redirect_to @recipe
    else
      flash[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully destroyed.'
    redirect_to recipes_url
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :cookingTime, :preparationTime, :description, :public)
  end
end

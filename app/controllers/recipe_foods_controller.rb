class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    if @recipe_food.save
      flash[:notice] = 'Ingredient added successfully.'
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    @recipe_food.destroy
    flash[:notice] = "Recipe's Food deleted successfully."
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end

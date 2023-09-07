class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @available_food = @user.foods
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params.merge(recipe_id: @recipe.id))
    if @recipe_food.valid?
      @recipe_food.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def modify
    @recipe_food = RecipeFood.find_by_id(params[:id])
    new_quantity = params[:recipe_food][:quantity]
    # Rails.logger.debug("Updating quantity to {new_quantity}")

    if @recipe_food.update(quantity: new_quantity)
      flash[:success] = 'Quantity updated successfully'
    else
      flash[:error] = 'Failed to update quantity'
    end

    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Ingredient deleted.'
    else
      flash[:fail] = 'Ingredient deletion unsucessful.'
    end
    redirect_to recipes_path(params[:recipe_id]), method: :get
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end

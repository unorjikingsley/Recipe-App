class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @user = current_user
    if @user.nil?
      redirect_to user_session_path, flash: { alert: 'You must be signed in to continue.' }
    else
      @recipes = @user.recipes
    end
  end

  def new
    @recipe = Recipe.new
    @foods_to_buy = Food.all
    @recipe.recipe_foods.build
    @user = current_user
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    @recipe_foods = @recipe&.recipe_foods
    @recipe = 'No recipes' if @recipe.nil?
    @user = current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      render :new
      flash[:notice] = 'Error adding recipe'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'Recipe deleted!'
    redirect_to recipes_path
  end

  # The public_recipes action retrieves a list of recipes marked as public (public: true)
  # and assigns them to @recipes.
  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  # The toggle_public action is used to toggle the "public" status of a recipe. It finds
  # the recipe by its :recipe_id parameter, toggles its public attribute (changing it
  # from true to false or vice versa), and then redirects to the recipe's show page.
  def toggle_public
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.toggle!(:public)
    redirect_to recipe_path(@recipe)
  end

  # generating a general shopping list based on the user's recipes and inventory of foods.
  # This action appears to calculate the foods to buy and inventory adjustments, and then
  # renders a shopping list template.

  # def general_shopping_list
  #   @user = current_user
  #   @recipes = @user.recipes
  #   @foods_to_buy = {}
  #   @inventory = @user.foods

  #   # subtract inventory from shopping list

  #   @recipes.each do |recipe|
  #     recipe.recipe_foods.each do |recipe_food|
  #       if @foods_to_buy.key?(recipe_food.food.name)
  #         @foods_to_buy[recipe_food.food.name].quantity += recipe_food.quantity
  #       else
  #         @foods_to_buy[recipe_food.food.name] = recipe_food
  #       end
  #     end
  #   end

  #   puts 'Foods to buy: '
  #   @foods_to_buy.each do |key, value|
  #     puts "#{key}: #{value.quantity}"
  #   end

  #   @inventory.each do |inventory_food|
  #     @foods_to_buy[inventory_food.name].quantity -= inventory_food.quantity
  #       if @foods_to_buy.key?(inventory_food.name)
  #   end

  #   # remove foods with quantity <= 0
  #   @foods_to_buy.each do |key, value|
  #     @foods_to_buy.delete(key) if value.quantity <= 0
  #   end

  #   render 'shopping-list/index'
  # end

  # rubocop:disable Metrics
  def general_shopping_list
    @user = current_user
    @recipes = @user.recipes
    @foods_to_buy = {}
    @inventory = @user.foods.to_h { |food| [food.id, food] }

    # Calculate the foods to buy
    @recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        if @inventory.key?(recipe_food.food_id)
          if @foods_to_buy.key?(recipe_food.food.name)
            @foods_to_buy[recipe_food.food.name].quantity += recipe_food.quantity
          else
            @foods_to_buy[recipe_food.food.name] = recipe_food.dup
          end
        end
      end
    end

    # Calculate the total food items and total price of the missing food
    total_food_items = @foods_to_buy.values.sum(&:quantity)
    total_price = @foods_to_buy.values.sum { |food| food.food.price * food.quantity }

    render 'shopping-list/index', locals: { total_food_items:, total_price: }
  end
  # rubocop:enable Metrics

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

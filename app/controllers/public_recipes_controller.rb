class PublicRecipesController < ApplicationController
  def index
    @recipes = public_recipes
  end

  private

  def public_recipes
    Recipe.where(public: true).order(created_at: :desc)
  end
end

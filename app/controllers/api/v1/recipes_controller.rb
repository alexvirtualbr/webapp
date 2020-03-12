class Api::V1::RecipesController < ApplicationController
  def index
    recipes = Recipe.all.order(created_at: :desc)
    if recips
      render json: { results: recipes }.to_json, status: :ok
    else
      render json: { results: recipes.errors }.to_json, status: :error
    end

  end

  def create
    recipe = Recipe.create!(recipe_params)
    if recipe
      render json: { results: recipe }.to_json, status: :created
    else
      render json: { results: recipe.errors }.to_json, status: :error
    end
  end

  def show
    if recipe
      render json: { results: recipe }.to_json, status: :ok
    else
      render json: { results: recipe.errors }.to_json, status: :error
    end
  end

  def destroy
    recipe&.destroy
    render json: { message: 'Recipe was successfully destroyed!' }.to_json, status: :destroyed
  end

  private

    def recipe_params
      params.permit(:name, :image, :ingredients, :instruction)
    end

    def recipe
      recipe ||= Recipe.find(params[:id])
    end
end

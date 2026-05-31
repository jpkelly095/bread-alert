class RecipesController < ApplicationController
  before_action :set_recipe, only: [ :show, :edit, :update, :destroy ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.bakes.build(baked_on: Date.current)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.includes(:bakes, ingredients: :food).find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :notes, :total_weight,
        ingredients_attributes: [ :id, :food_id, :quantity, :_destroy ],
        bakes_attributes: [ :id, :baked_on, :total_weight, :container_id ])
    end
end

class BakesController < ApplicationController
  before_action :set_bake, only: %i[ show edit update destroy ]

  # GET /bakes/1 or /bakes/1.json
  def show
  end

  # GET /bakes/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @bake = @recipe.bakes.build(baked_on: Date.current)
  end

  # GET /bakes/1/edit
  def edit
  end

  # POST /bakes or /bakes.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @bake = @recipe.bakes.build(bake_params)

    if @bake.save
      redirect_to @bake, notice: "Bake was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bakes/1 or /bakes/1.json
  def update
    if @bake.update(bake_params)
      redirect_to @bake, notice: "Bake was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bakes/1 or /bakes/1.json
  def destroy
    @bake.destroy!
    redirect_to @bake.recipe, notice: "Bake was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bake
      @bake = Bake.includes(:recipe, :container).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bake_params
      params.expect(bake: [ :baked_on, :total_weight, :container_id ])
    end
end

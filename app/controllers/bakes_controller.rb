class BakesController < ApplicationController
  before_action :set_bake, only: %i[ show edit update destroy ]

  # GET /bakes or /bakes.json
  def index
    @bakes = Bake.all
  end

  # GET /bakes/1 or /bakes/1.json
  def show
  end

  # GET /bakes/new
  def new
    @bake = Bake.new
  end

  # GET /bakes/1/edit
  def edit
  end

  # POST /bakes or /bakes.json
  def create
    @bake = Bake.new(bake_params)

    respond_to do |format|
      if @bake.save
        format.html { redirect_to @bake, notice: "Bake was successfully created." }
        format.json { render :show, status: :created, location: @bake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bakes/1 or /bakes/1.json
  def update
    respond_to do |format|
      if @bake.update(bake_params)
        format.html { redirect_to @bake, notice: "Bake was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @bake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bakes/1 or /bakes/1.json
  def destroy
    @bake.destroy!

    respond_to do |format|
      format.html { redirect_to bakes_path, notice: "Bake was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bake
      @bake = Bake.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bake_params
      params.expect(bake: [ :baked_on, :total_carbs, :total_weight, :recipe_id, :container_id ])
    end
end

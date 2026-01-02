class FoodsController < ApplicationController
  before_action :set_food, only: [ :show, :edit, :update, :destroy ]

  def index
    @foods = Food.all
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to @food
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path
  end

  private
    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.expect(food: [ :name, :carbs_per_serving, :serving_size, :notes ])
    end
end

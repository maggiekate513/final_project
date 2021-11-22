class MealsController < ApplicationController
  before_action :current_user_must_be_meal_recipe_inventor, only: [:edit, :update, :destroy] 

  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  def index
    @meals = Meal.page(params[:page]).per(10)
  end

  # GET /meals/1
  def show
    @ingredient = Ingredient.new
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      message = 'Meal was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @meal, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
    message = "Meal was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to meals_url, notice: message
    end
  end


  private

  def current_user_must_be_meal_recipe_inventor
    set_meal
    unless current_user == @meal.recipe_inventor
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meal_params
      params.require(:meal).permit(:chef, :description)
    end
end

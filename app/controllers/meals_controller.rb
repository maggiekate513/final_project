class MealsController < ApplicationController
  before_action :current_user_must_be_meal_recipe_inventor,
                only: %i[edit update destroy]

  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(distinct: true).includes(:recipe_inventor,
                                                :ingredients).page(params[:page]).per(10)
  end

  def show
    @ingredient = Ingredient.new
  end

  def new
    @meal = Meal.new
  end

  def edit; end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      message = "Meal was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @meal, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: "Meal was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    message = "Meal was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to meals_url, notice: message
    end
  end

  private

  def current_user_must_be_meal_recipe_inventor
    set_meal
    unless current_user == @meal.recipe_inventor
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:chef, :description)
  end
end

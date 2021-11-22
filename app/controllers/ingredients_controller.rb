class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      message = 'Ingredient was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @ingredient, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    message = "Ingredient was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to ingredients_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:meal_id, :name, :category_id, :store_id, :cost)
    end
end

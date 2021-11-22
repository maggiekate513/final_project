class GroceryStoresController < ApplicationController
  before_action :set_grocery_store, only: %i[show edit update destroy]

  def index
    @q = GroceryStore.ransack(params[:q])
    @grocery_stores = @q.result(distinct: true).includes(:ingredients,
                                                         :categories, :meals).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@grocery_stores.where.not(location_latitude: nil)) do |grocery_store, marker|
      marker.lat grocery_store.location_latitude
      marker.lng grocery_store.location_longitude
    end
  end

  def show
    @ingredient = Ingredient.new
  end

  def new
    @grocery_store = GroceryStore.new
  end

  def edit; end

  def create
    @grocery_store = GroceryStore.new(grocery_store_params)

    if @grocery_store.save
      redirect_to @grocery_store,
                  notice: "Grocery store was successfully created."
    else
      render :new
    end
  end

  def update
    if @grocery_store.update(grocery_store_params)
      redirect_to @grocery_store,
                  notice: "Grocery store was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @grocery_store.destroy
    redirect_to grocery_stores_url,
                notice: "Grocery store was successfully destroyed."
  end

  private

  def set_grocery_store
    @grocery_store = GroceryStore.find(params[:id])
  end

  def grocery_store_params
    params.require(:grocery_store).permit(:store_name, :location)
  end
end

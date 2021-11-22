class GroceryStoresController < ApplicationController
  before_action :set_grocery_store, only: [:show, :edit, :update, :destroy]

  # GET /grocery_stores
  def index
    @grocery_stores = GroceryStore.all
  end

  # GET /grocery_stores/1
  def show
  end

  # GET /grocery_stores/new
  def new
    @grocery_store = GroceryStore.new
  end

  # GET /grocery_stores/1/edit
  def edit
  end

  # POST /grocery_stores
  def create
    @grocery_store = GroceryStore.new(grocery_store_params)

    if @grocery_store.save
      redirect_to @grocery_store, notice: 'Grocery store was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grocery_stores/1
  def update
    if @grocery_store.update(grocery_store_params)
      redirect_to @grocery_store, notice: 'Grocery store was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grocery_stores/1
  def destroy
    @grocery_store.destroy
    redirect_to grocery_stores_url, notice: 'Grocery store was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_store
      @grocery_store = GroceryStore.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grocery_store_params
      params.require(:grocery_store).permit(:store_name)
    end
end

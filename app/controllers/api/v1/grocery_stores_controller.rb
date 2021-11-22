class Api::V1::GroceryStoresController < Api::V1::GraphitiController
  def index
    grocery_stores = GroceryStoreResource.all(params)
    respond_with(grocery_stores)
  end

  def show
    grocery_store = GroceryStoreResource.find(params)
    respond_with(grocery_store)
  end

  def create
    grocery_store = GroceryStoreResource.build(params)

    if grocery_store.save
      render jsonapi: grocery_store, status: :created
    else
      render jsonapi_errors: grocery_store
    end
  end

  def update
    grocery_store = GroceryStoreResource.find(params)

    if grocery_store.update_attributes
      render jsonapi: grocery_store
    else
      render jsonapi_errors: grocery_store
    end
  end

  def destroy
    grocery_store = GroceryStoreResource.find(params)

    if grocery_store.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: grocery_store
    end
  end
end

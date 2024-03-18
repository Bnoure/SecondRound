class Seller::StoresController < ApplicationController
  def index
    @stores = current_user.stores
  end

  def show
    @store = Store.find(params[:id])
    
  end
end

class InventoryFoodsController < ApplicationController
  def index
    @current_inventory = Inventory.find(params[:inventory_id])
    @food_list = Food.where(user_id: current_user.id)
    @inventory_food_list = InventoryFood.where(inventory_id: params[:inventory_id])
  end

  def new
  end

  def create
    @new_food = InventoryFood.new(quantity: params[:quantity], food_id: params[:food],
      inventory_id: params[:inventory_id])
    new_status = true
    InventoryFood.all.each do |each|
    new_status = false if each.inventory_id == @new_food.inventory_id && each.food_id == @new_food.food_id
    end
    if @new_food.valid? && new_status
    @new_food.save
    flash[:success] = 'Food added successfully'
    elsif !new_status
    flash[:error] = 'Already exists. Please delete to create new one'
    else
    flash[:error] = 'Food could not be created'
    end
    @food_list = Food.where(user_id: current_user.id)
    @inventory_food_list = InventoryFood.where(inventory_id: params[:inventory_id])
    redirect_to inventory_inventory_foods_path(@new_food.inventory_id)
    end
  end

  def destroy
    InventoryFood.find(params[:id]).destroy
    redirect_to inventory_inventory_foods_path(params[:inventory_id])
  end
end

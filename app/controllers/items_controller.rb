class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :area_id, :date_id, :price, :user)
  end

end

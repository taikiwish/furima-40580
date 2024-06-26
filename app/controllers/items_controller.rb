class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :furima_find, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :fee_id, :area_id, :deliverydate_id, :price).merge(user_id: current_user.id)
  end

  def furima_find
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.user_id != current_user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

end

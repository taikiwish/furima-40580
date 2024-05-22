class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      Rails.logger.debug(@purchase_address.errors.full_messages)
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:zipcode, :area_id, :city, :number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
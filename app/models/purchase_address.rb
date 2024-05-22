class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zipcode, :area_id, :city, :number, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { only_integer: true }
    validates :city, :number, :phone, :user_id, :item_id, :token
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, area_id: area_id, city: city, number: number, building: building, phone: phone, purchase_id: purchase.id)
  end
end
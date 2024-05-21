class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :zipcode, :area_id, :city, :number, :building, :phone, :user, :item

  with_options presence: true do
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { only_integer: true }
    validates :city, :number, :purchase
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
    validates :user, :item
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(item: item, user: user)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(zipcode: zipcode, area_id: area_id, city: city, number: number, building: building, phone: phone, purchase: purchase.id)
  end
end
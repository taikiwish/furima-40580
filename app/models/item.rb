class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :date
  has_one_attached :image

  validates :name,:description,:category_id,:condition_id,:fee_id,:area_id,:deliverydate_id,:price,:user, presence: true
  validates :category_id, :condition_id, :fee_id, :area_id, :deliverydate_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, format: { with: /\A[3-9]\d{2,6}\z/, message: "¥300以上¥9,999,999以下の半角数値で入力してください" }
end

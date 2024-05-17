class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :deliverydate
  has_one_attached :image

  validates :image,:name,:description,:category_id,:condition_id,:fee_id,:area_id,:deliverydate_id,:price,:user, presence: true
  validates :category_id, :condition_id, :fee_id, :area_id, :deliverydate_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300以上9,999,999以下の半角数値で入力してください"}
end

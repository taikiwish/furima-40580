class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :date
  has_one_attached :image

  validates :name,:description,:category_id,:condition_id,:fee_id,:area_id,:date_id,:price,:user, presence: true
  validates :category_id, :condition_id, :fee_id, :area_id, :date_id, numericality: { other_than: 1 , message: "can't be blank"} 
end

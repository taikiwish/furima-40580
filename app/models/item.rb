class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,:description,:category_id,:condition_id,:fee_id,:area_id,:date_id,:price,:user, presence: true
end

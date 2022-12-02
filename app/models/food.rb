class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  belongs_to :user

  # validation
  validates :name, presence: true, length: { maximum: 250 }
  validates :measurment_unit, presence: true, length: { maximum: 250 }
  validates :price, presence: true, length: { maximum: 250 }
  validates :quantity, presence: true, length: { maximum: 250 }
end

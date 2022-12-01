class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy

  # validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true, length: { maximum: 250 }
  validates :cooking_time, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :public, inclusion: [true, false]
end

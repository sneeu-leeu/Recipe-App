class Food < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :measurementUnit, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 1_000_000 }

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end

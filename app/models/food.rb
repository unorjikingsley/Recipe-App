class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy
  has_many :recipes, through: :recipe_foods

  # Attributes
  attribute :name, :string
  attribute :measurement_unit, :string
  attribute :price, :decimal
  attribute :quantity, :integer

  validates :name, presence: true, length: { maximum: 50 }
  validates :measurement_unit, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

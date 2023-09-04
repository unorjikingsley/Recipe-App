class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
end

# belongs_to :user
# has_many :recipe_foods
# has_many :foods, through: :recipe_foods

# belongs_to :user, class_name: 'User'

# attribute :name, :string
# attribute :preparation_time, :integer
# attribute :cooking_time, :integer
# attribute :description, :text
# attribute :public, :boolean

# validates :title, presence: true, length: { maximum: 250 }
# validates :preparation_time, numericality: { greater_than_or_equal_to: 0, only_integer: true }
# validates :cooking_time, numericality: { greater_than_or_equal_to: 0, only_integer: true }
# validates :description,
# validates :public,

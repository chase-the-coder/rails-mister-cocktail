class Ingredient < ApplicationRecord
  has_many :doses, dependent: :restrict
  validates :name, uniqueness: true
end

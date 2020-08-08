class Recipe < ApplicationRecord
  has_many :post
  validates :name, :description, :ingredients, :instruction, presence: true

end
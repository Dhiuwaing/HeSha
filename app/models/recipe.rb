class Recipe < ApplicationRecord
  has_many :post
  validates :name, :description, :ingredients, :instruction, presence: true
  acts_as_taggable_on :tags

end

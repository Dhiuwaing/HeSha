class Recipe < ApplicationRecord
  has_many :posts
  validates :name, :description, :ingredients, :instruction, presence: true
  acts_as_taggable_on :tags
  acts_as_favoritable

end

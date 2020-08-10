class Recipe < ApplicationRecord
  has_many :posts
  validates :name, :description, :ingredients, :instruction, presence: true
  acts_as_favoritable

  include PgSearch::Model
    pg_search_scope :search_by_name_description_ingredients,
    against: {
    name: 'A',
    ingredients: 'B',
    description: 'C'
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

end

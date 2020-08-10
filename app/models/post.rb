class Post < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :image, :description, presence: true
  acts_as_votable
  acts_as_favoritable


end

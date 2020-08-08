class User < AppleicationRecord
  has_many :posts
  acts_as_voter
  acts_as_favoritor
end

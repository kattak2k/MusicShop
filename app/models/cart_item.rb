class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :user, presence: true 
  validates :album, presence: true
  validates :album, uniqueness: {scope: :user} #this combination has to be unique
end

class Album < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 100 }
     
end

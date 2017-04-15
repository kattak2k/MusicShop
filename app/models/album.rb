# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 100 }

    scope :popular, -> {where( popular: true)}     
end

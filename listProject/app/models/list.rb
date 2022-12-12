class List < ApplicationRecord
  has_many :items
  belongs_to :section
end

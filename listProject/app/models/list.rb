class List < ApplicationRecord
  has_many :items
  belongs_to :section, optional: true
  belongs_to :user
end

class List < ApplicationRecord
  has_many :items
  belongs_to :section, optional: true

  belongs_to :user


  has_many :permissions, dependent: :destroy
  has_many :permissables, through: :permissions

end 

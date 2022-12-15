class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :permssions, as: :permissable
  has_many :lists, as: :permissable, through: :permissions

end

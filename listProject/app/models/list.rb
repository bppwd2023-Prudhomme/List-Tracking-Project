class List < ApplicationRecord
  has_many :items
  belongs_to :section, optional: true

  belongs_to :user


  has_many :permissions
  has_and_belongs_to_many :permissables, polymorphic: true

end 

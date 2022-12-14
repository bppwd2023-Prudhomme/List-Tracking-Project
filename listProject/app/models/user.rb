class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups

  has_many :permissions, as: :permissable
  has_many :lists, through: :permissions

  has_many :mylists, class_name: "List"

  has_many :sections
  
end

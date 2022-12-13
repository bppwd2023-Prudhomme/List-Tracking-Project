class Permission < ApplicationRecord
  belongs_to :permissable, polymorphic: true
  belongs_to :list

end

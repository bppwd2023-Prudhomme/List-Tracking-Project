class CreateJoinTableGroupsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_users, id: false do |t|
      t.belongs_to :group
      t.belongs_to :user
    end
  end
end

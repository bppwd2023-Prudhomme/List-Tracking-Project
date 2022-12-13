class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.integer :permissable_id
      t.integer :list_id
      t.string :title
      t.boolean :canRead
      t.boolean :canUpdelete
      t.string :permissable_type

      t.timestamps
    end
  end
end

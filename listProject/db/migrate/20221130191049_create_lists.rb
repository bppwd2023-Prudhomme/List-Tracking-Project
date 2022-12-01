class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :section_id
      t.string :title
      t.boolean :archived

      t.timestamps
    end
  end
end

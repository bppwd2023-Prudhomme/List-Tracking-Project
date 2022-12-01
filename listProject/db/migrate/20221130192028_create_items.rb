class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :title
      t.boolean :important
      t.datetime :deadline

      t.timestamps
    end
  end
end

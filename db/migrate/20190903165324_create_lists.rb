class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :tittle
      t.boolean :completed, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

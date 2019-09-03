class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :tittle
      t.boolean :completed, default: false 
      t.text :description
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end

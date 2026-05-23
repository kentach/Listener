class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.references :textbook, null: false, foreign_key: true
      t.string :title, null: false
      t.string :learning_mode, null: false
      t.text :description
      t.timestamps
    end
  end
end

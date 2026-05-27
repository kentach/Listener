class CreateBooklists < ActiveRecord::Migration[7.2]
  def change
    create_table :booklists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :textbook, null: false, foreign_key: true

      t.timestamps
    end

    add_index :booklists,
      [:user_id, :textbook_id],
      unique: true
  end
end

class CreateLearningRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :learning_records do |t|
      t.boolean :completed
      t.integer :play_count
      t.references :user, null: false, foreign_key: :true
      t.references :audio, null: false, foreign_key: :true

      t.timestamps
    end

    add_index :learning_records, [ :user_id, :audio_id ], unique: true
  end
end

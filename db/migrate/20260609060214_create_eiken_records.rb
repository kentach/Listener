class CreateEikenRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :eiken_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :level
      t.integer :speaking_score
      t.integer :reading_score
      t.integer :listening_score
      t.integer :writing_score
      t.date :exam_date
      t.text :memo

      t.timestamps
    end
  end
end

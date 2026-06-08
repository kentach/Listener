class CreateAllowedStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :allowed_students do |t|
      t.string :student_id, null: false  # null: false を追加
      t.timestamps
    end
    add_index :allowed_students, :student_id, unique: true  # ユニークインデックスを追加
  end
end

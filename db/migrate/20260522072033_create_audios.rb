class CreateAudios < ActiveRecord::Migration[7.2]
  def change
    create_table :audios do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :title, null: false
      t.string :file_name, null: false
      t.text :ja_script
      t.text :en_script
      t.timestamps
    end
  end
end

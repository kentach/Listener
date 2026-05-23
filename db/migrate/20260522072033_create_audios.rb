class CreateAudios < ActiveRecord::Migration[7.2]
  def change
    create_table :audios do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :title
      t.string :file_name, null: false
      t.text :script
      
      t.timestamps
    end
  end
end
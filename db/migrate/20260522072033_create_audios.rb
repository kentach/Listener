class CreateAudios < ActiveRecord::Migration[7.2]
  def change
    create_table :audios do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :title
      t.string :file_name, null: false
      t.text :ja_script #日本語のスクリプト
      t.text :en_script #英語のスクリプト
      
      t.timestamps
    end
  end
end
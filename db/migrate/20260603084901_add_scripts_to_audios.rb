class AddScriptsToAudios < ActiveRecord::Migration[7.2]
  def change
    add_column :audios, :ja_script, :text unless column_exists?(:audios, :ja_script)
    add_column :audios, :en_script, :text unless column_exists?(:audios, :en_script)
  end
end
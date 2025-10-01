class RemoveEikenLevelFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :eiken_level, :string
  end
end

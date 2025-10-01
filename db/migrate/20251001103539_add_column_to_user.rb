class AddColumnToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :eiken_level, :integer
    add_column :users, :school_grade, :integer
  end
end

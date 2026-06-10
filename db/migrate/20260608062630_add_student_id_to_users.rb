class AddStudentIdToUsers < ActiveRecord::Migration[7.2]
  def up
    add_column :users, :student_id, :string
    # Backfill existing users with a unique placeholder before indexing
    User.reset_column_information
    User.where(student_id: nil).find_each do |user|
      user.update_columns(student_id: "user_#{user.id}")
    end
    change_column_null :users, :student_id, false
    add_index :users, :student_id, unique: true
    remove_column :users, :email, :string
  end

  def down
    remove_index :users, :student_id
    remove_column :users, :student_id
    add_column :users, :email, :string
  end
end

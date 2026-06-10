class FixStudentIdOnUsers < ActiveRecord::Migration[7.2]
  def up
    add_column :users, :student_id, :string unless column_exists?(:users, :student_id)
  
    User.reset_column_information
    User.where(student_id: nil).find_each do |user|
      user.update_columns(student_id: "user_#{user.id}")
    end
  
    change_column_null :users, :student_id, false unless index_exists?(:users, :student_id)
    add_index :users, :student_id, unique: true unless index_exists?(:users, :student_id)
    remove_column :users, :email, :string if column_exists?(:users, :email)
  end

  def down
    remove_index :users, :student_id
    remove_column :users, :student_id
    add_column :users, :email, :string
  end
end

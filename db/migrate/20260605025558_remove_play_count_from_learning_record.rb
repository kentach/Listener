class RemovePlayCountFromLearningRecord < ActiveRecord::Migration[7.2]
  def change
    remove_column :learning_records, :play_count, :integer
  end
end

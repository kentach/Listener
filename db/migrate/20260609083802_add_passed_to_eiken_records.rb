class AddPassedToEikenRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :eiken_records, :passed, :boolean
  end
end

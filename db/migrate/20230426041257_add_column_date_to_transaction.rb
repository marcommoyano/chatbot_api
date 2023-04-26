class AddColumnDateToTransaction < ActiveRecord::Migration[5.2]
  def up
    add_column :transactions, :date, :date
  end

  def down
    remove_column :transactions, :date, :date
  end
end

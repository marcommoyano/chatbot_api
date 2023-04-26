class CreateTableAccount < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user
      t.integer :amount
      t.timestamps
    end
  end

  def down
    drop_table :accounts
  end
end

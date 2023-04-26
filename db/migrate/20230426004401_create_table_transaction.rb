class CreateTableTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :account
      t.string :adress
      t.integer :quantity
      t.boolean :is_paper_request
      t.timestamps
    end
  end

  def down
    drop_table :transactions
  end
end

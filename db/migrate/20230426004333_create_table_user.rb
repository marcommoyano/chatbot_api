class CreateTableUser < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :rut
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end

class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

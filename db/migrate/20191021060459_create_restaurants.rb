class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :description
      t.float :vote_num
      t.datetime :deadline
      t.timestamps
    end
  end
end

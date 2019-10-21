class CreateFoodImages < ActiveRecord::Migration[5.2]
  def change
    create_table :food_images do |t|
      t.string :image
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end

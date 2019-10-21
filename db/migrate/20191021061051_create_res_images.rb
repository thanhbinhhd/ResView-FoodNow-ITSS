class CreateResImages < ActiveRecord::Migration[5.2]
  def change
    create_table :res_images do |t|
      t.string :image
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

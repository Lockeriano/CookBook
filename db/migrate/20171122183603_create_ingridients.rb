class CreateIngridients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingridients do |t|
      t.integer :recipe_id
      t.string :name
      t.string :unit_type
      t.integer :unit_amount

      t.timestamps
    end
  end
end

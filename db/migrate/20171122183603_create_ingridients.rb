class CreateIngridients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingridients do |t|
      t.string :name
      t.string :unit_type

      t.timestamps
    end
  end
end

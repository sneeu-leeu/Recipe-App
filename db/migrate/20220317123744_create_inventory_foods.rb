class CreateInventoryFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantitiy

      t.timestamps
    end
  end
end

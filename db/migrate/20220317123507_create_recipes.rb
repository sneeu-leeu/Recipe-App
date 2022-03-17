class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preparationTime
      t.decimal :cookingTime
      t.text :description
      t.boolean :public, default: false

      t.timestamps
    end
  end
end

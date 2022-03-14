class CreateRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preperation_time
      t.decimal :cooking_time
      t.text :description
      t.boolean :public, default: false

      t.timestamps
    end
  end
end

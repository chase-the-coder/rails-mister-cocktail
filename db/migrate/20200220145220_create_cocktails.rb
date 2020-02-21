class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :instructions
      t.string :thumbnail
      array = (1..15).to_a
      array.each do |number|
        t.string "strIngredient#{number}"
        t.string "strMeasure#{number}"
      end
      t.timestamps
    end
  end
end

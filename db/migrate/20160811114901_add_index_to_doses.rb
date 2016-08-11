class AddIndexToDoses < ActiveRecord::Migration[5.0]
  def change
    add_index :doses, [:cocktail_id, :ingredient_id], unique: true
  end
end

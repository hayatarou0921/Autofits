class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :top_id, null: false
      t.integer :trouser_id, null: false
      t.integer :shoe_id, null: false
      t.timestamps
    end
  end
end

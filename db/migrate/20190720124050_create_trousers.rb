class CreateTrousers < ActiveRecord::Migration[5.2]
  def change
    create_table :trousers do |t|
      t.string :image

      t.timestamps
    end
  end
end

class AddReferenceToTrousers < ActiveRecord::Migration[5.2]
  def change
    add_reference :trousers, :user, foreign_key: true
  end
end

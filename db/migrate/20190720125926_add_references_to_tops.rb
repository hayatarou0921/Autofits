class AddReferencesToTops < ActiveRecord::Migration[5.2]
  def change
    add_reference :tops, :user, foreign_key: true
  end
end

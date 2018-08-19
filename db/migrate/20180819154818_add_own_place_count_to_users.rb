class AddOwnPlaceCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :own_places_count, :integer
  end
end

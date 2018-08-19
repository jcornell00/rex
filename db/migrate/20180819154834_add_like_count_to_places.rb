class AddLikeCountToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :likes_count, :integer
  end
end

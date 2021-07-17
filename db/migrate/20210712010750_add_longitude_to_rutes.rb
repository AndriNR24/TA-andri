class AddLongitudeToRutes < ActiveRecord::Migration[6.1]
  def change
    add_column :rutes, :longitude, :float
  end
end

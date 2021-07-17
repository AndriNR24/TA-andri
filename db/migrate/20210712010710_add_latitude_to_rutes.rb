class AddLatitudeToRutes < ActiveRecord::Migration[6.1]
  def change
    add_column :rutes, :Latitude, :float
  end
end

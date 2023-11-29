class AddCoordinatesToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :latitude, :float
    add_column :profiles, :longitude, :float
  end
end

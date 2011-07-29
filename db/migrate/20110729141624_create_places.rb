class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :vicinity
      t.string :type_poi
      t.float :lat
      t.float :lon
      t.string :thumbnail
      t.string :address
      t.string :phoneNumber
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end

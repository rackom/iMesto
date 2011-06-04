class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :address
      t.datetime :event_date
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

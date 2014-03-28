class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string    :name
      t.integer   :region_id
    end
  end
end

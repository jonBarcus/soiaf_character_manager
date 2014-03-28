class AddUseridToHousesAndCharacters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.integer   :user_id
    end

    change_table :houses do |t|
      t.integer   :user_id
    end
  end
end

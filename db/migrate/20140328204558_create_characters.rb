class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string          :name
      t.integer         :age
      t.string          :gender
      t.integer         :house_id,        :default => 1
      t.integer         :agility,         :default => 2
      t.integer         :animal_handling, :default => 2
      t.integer         :athletics,       :default => 2
      t.integer         :awareness,       :default => 2
      t.integer         :cunning,         :default => 2
      t.integer         :deception,       :default => 2
      t.integer         :endurance,       :default => 2
      t.integer         :fighting,        :default => 2
      t.integer         :healing,         :default => 2
      t.integer         :language,        :default => 2
      t.integer         :knowledge,       :default => 2
      t.integer         :marksmanship,    :default => 2
      t.integer         :persuasion,      :default => 2
      t.integer         :status,          :default => 2
      t.integer         :stealth,         :default => 2
      t.integer         :survival,        :default => 2
      t.integer         :thievery,        :default => 2
      t.integer         :warfare,         :default => 2
      t.integer         :will,            :default => 2
      t.boolean         :is_alive,        :default => true
      t.timestamps
    end
  end
end

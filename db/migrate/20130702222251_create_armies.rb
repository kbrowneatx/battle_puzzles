class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.string :name
      t.integer :total_xp,                  :default => 0
      t.integer :divisions_allowed,         :default => 2
      t.integer :battalions_allowed,        :default => 6
      t.references :user
      t.references :era
      t.references :nation

      t.timestamps
    end
    add_index :armies, :era_id
    add_index :armies, :nation_id
  end
end

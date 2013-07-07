class CreateBattalions < ActiveRecord::Migration
  def change
    create_table :battalions do |t|
      t.string :name
      t.integer :health
      t.references :division
      t.references :unit_type

      t.timestamps
    end
    add_index :battalions, :division_id
    add_index :battalions, :unit_type_id
  end
end

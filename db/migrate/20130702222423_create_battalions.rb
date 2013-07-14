class CreateBattalions < ActiveRecord::Migration
  def change
    create_table :battalions do |t|
      t.string :name
      t.integer :health
      t.references :division
      t.references :unit_class

      t.timestamps
    end
    add_index :battalions, :division_id
    add_index :battalions, :unit_class_id
  end
end

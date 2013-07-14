class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :name
      t.references :nation
      t.references :unit_class
      t.string :img_name

      t.timestamps
    end
    add_index :unit_types, :unit_class_id
    add_index :unit_types, :nation_id
  end
end

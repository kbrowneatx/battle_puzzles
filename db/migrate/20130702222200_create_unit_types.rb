class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :name
      t.references :era
      t.references :nation
      t.string :img_name

      t.timestamps
    end
    add_index :unit_types, :era_id
    add_index :unit_types, :nation_id
  end
end

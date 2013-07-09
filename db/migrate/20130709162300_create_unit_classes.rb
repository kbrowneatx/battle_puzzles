class CreateUnitClasses < ActiveRecord::Migration
  def change
    create_table :unit_classes do |t|
      t.string :iname
      t.string :name
      t.integer :move_pts
      t.integer :strike_pts
      t.integer :spec_pts

      t.timestamps
    end
  end
end

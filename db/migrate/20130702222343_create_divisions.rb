class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :army

      t.timestamps
    end
    add_index :divisions, :army_id
  end
end

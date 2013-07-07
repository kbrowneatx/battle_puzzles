class CreateNations < ActiveRecord::Migration
  def change
    create_table :nations do |t|
      t.string :name
      t.string :flag_img
      t.references :era

      t.timestamps
    end
    add_index :nations, :era_id
  end
end

class CreateWheaters < ActiveRecord::Migration[6.0]
  def change
    create_table :wheaters do |t|
      t.integer :city_id
      t.string :city_name
      t.decimal :temp, precision: 10, scale: 4
      t.decimal :temp_max, precision: 10, scale: 4
      t.decimal :temp_min, precision: 10, scale: 4
      t.string :metric

      t.timestamps
    end
  end
end

class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :percent_off
      t.datetime :starts_on
      t.datetime :ends_on

      t.timestamps null: false
    end
  end
end

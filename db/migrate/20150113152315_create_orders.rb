class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :county, index: true
      t.belongs_to :township, index: true
      t.integer :total

      t.timestamps null: false
    end
    add_foreign_key :orders, :counties
    add_foreign_key :orders, :townships
  end
end

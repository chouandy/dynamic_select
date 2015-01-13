class CreateTownships < ActiveRecord::Migration
  def change
    create_table :townships do |t|
      t.belongs_to :county, index: true
      t.string :name
      t.string :zip_code
    end
    add_foreign_key :townships, :counties
  end
end

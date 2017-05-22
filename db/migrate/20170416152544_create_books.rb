class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn, null: false, unique: true
      t.string :name, null: false
      t.integer :part
      t.integer :imprint_year, null: false
      t.integer :number_of_shelf
      t.references :stack, index: true, foreign_key: true
      t.integer :number_of_copies, null: false
      t.index [:imprint_year, :part, :isbn], unique: true
      t.timestamps null: false
    end
  end
end

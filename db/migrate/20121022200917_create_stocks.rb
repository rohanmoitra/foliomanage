class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :holding
      t.decimal :price, :precision => 5, :scale=> 2

      t.timestamps
    end
  end

  def self.down
    drop_tables :stocks
  end
end

class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :issued_at
      t.text :description
      t.decimal :total_price
      t.decimal :tax_price

      t.timestamps null: false
    end
  end
end

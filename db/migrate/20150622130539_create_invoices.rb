class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :invoiced_at
      t.string :name
      t.decimal :total_price
      t.decimal :tax_price

      t.timestamps null: false
    end
  end
end

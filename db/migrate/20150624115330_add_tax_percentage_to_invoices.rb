class AddTaxPercentageToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :tax_percentage, :decimal
    remove_column :invoices, :tax_price
  end
end

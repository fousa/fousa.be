class RenameTotalPriceToNetPriceOnInvoices < ActiveRecord::Migration
  def change
    rename_column :invoices, :total_price, :net_price
  end
end

class AddCustomerIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :customer_id, :integer
  end
end

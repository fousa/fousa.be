class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :vat_number

      t.timestamps null: false
    end
  end
end

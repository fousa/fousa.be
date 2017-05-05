class AddOrderToApps < ActiveRecord::Migration
  def change
    add_column :apps, :order, :int
  end
end

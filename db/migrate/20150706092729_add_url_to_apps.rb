class AddUrlToApps < ActiveRecord::Migration
  def change
    add_column :apps, :url, :string
  end
end

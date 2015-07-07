class AddLogoToApps < ActiveRecord::Migration
  def change
    add_column :apps, :logo, :string
  end
end

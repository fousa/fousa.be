class AddContentToApps < ActiveRecord::Migration
  def change
    add_column :apps, :text, :text
  end
end

class RemoveNameSuffixFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :name_suffix
  end
end

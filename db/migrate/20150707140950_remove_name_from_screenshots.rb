class RemoveNameFromScreenshots < ActiveRecord::Migration
  def change
    remove_column :screenshots, :name
  end
end

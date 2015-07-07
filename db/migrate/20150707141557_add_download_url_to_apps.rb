class AddDownloadUrlToApps < ActiveRecord::Migration
  def change
    add_column :apps, :download_url, :string
  end
end

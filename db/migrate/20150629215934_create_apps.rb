class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :name_suffix
      t.string :short_text
      t.string :dashboard_image

      t.timestamps null: false
    end
  end
end

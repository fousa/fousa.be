class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :name
      t.string :image
      t.integer :app_id

      t.timestamps null: false
    end
  end
end

class AddRenderedTextToApps < ActiveRecord::Migration
  def change
    add_column :apps, :rendered_text, :text
  end
end

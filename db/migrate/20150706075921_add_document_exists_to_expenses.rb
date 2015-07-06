class AddDocumentExistsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :document_exists, :boolean, default: false, null: false
  end
end

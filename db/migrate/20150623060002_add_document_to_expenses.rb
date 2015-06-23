class AddDocumentToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :document, :string
  end
end

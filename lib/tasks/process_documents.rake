namespace :process do
  desc 'Update the document cache.'
  task :documents => :environment do
    Expense.all.each do |expense|
      expense.update_attribute :document_exists, expense.document.file.exists?
    end
  end
end

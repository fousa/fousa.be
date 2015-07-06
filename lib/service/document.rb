module Service
  class Document
    def initialize expense
      @expense = expense
    end

    def process
      process_existing
    end

    private

    def process_existing
      exists = @expense.document.file.exists?
      @expense.update_attribute :document_exists, exists
    end
  end
end

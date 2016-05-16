module UdaciListErrors
  # Error classes go here
  class AddUnsupportedItem < StandardError
  end

  class DeleteUnavailableItem < StandardError
  end

  class InvalidPriority < StandardError
  end

end

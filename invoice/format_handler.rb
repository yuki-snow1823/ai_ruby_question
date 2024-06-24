class FormatHandler
  def handle(report_data)
    raise NotImplementedError, 'Subclasses must implement a handle method'
  end
end
require 'json'
require_relative './format_handler'

class JsonHandler < FormatHandler
  def handle(report_data)
    report_data.to_json
  end
end
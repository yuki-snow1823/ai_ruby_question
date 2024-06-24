# text_handler.rb
require_relative './format_handler'

class TextHandler < FormatHandler
  def handle(report_data)
    <<-TEXT
Total Sales: #{report_data[:total_sales]}
Daily Sales:
#{report_data[:daily_sales].join("\n")}
Date Range: #{report_data[:date_range]}
    TEXT
  end
end

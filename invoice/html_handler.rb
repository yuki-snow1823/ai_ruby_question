require_relative './format_handler'

class HtmlHandler < FormatHandler
  def handle(report_data)
    <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>Sales Report</title>
</head>
<body>
  <h1>Sales Report</h1>
  <p>Total Sales: #{report_data[:total_sales]}</p>
  <h2>Daily Sales</h2>
  <ul>
    #{report_data[:daily_sales].map { |sale| "<li>#{sale}</li>" }.join}
  </ul>
  <p>Date Range: #{report_data[:date_range]}</p>
</body>
</html>
    HTML
  end
end

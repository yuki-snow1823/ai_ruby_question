# sales_report_generator.rb
require_relative './format_handler'
require_relative './text_handler'
require_relative './html_handler'
require_relative './json_handler'

class SalesReportGenerator
  attr_reader :sales_data

  def initialize(sales_data)
    @sales_data = sales_data
  end

  def generate_report(format)
    handler = get_handler(format)
    report_data = {
      total_sales: total_sales,
      daily_sales: daily_sales,
      date_range: date_range
    }
    handler.handle(report_data)
  end

  private

  def get_handler(format)
    case format
    when 'TEXT'
      TextHandler.new
    when 'HTML'
      HtmlHandler.new
    when 'JSON'
      JsonHandler.new
    else
      raise 'Invalid format'
    end
  end

  def total_sales
    @sales_data.sum { |sale| sale[:amount] }
  end

  def daily_sales
    @sales_data.map { |sale| "#{sale[:date]}: #{sale[:amount]}" }
  end

  def date_range
    start_date = @sales_data.first[:date]
    end_date = @sales_data.last[:date]
    "#{start_date} - #{end_date}"
  end
end

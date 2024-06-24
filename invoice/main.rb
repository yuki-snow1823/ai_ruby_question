#!/usr/bin/env ruby
require_relative './sales_report_generator'

sales_data = [
  { date: '2023-03-01', amount: 1000 },
  { date: '2023-03-02', amount: 1500 },
  { date: '2023-03-03', amount: 1200 }
]

generator = SalesReportGenerator.new(sales_data)

puts generator.generate_report('TEXT')
puts generator.generate_report('HTML')
puts generator.generate_report('JSON')

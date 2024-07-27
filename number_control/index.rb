# frozen_string_literal: true

numbers = gets.split.map(&:to_i)

def process_integers(numbers)
  doubled_numbers = numbers.map { |n| n * 2 }
  plus_minus_numbers = doubled_numbers.map { |n| n.even? ? n + 1 : n - 2 }
  plus_minus_numbers.sum
end

puts process_integers(numbers)

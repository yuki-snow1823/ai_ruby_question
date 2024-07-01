# frozen_string_literal: true

input_count = gets.to_i

input_pairs = []

(input_count - 1).times do
  input_pairs << gets.split(' ').map(&:to_i)
end

adjacency_list = Array.new(input_count) { [] }

# ここが難しかった。1つ前の配列に次のを入れるイメージ
input_pairs.each do |n, m|
  adjacency_list[n - 1] << m
  adjacency_list[m - 1] << n
end

adjacency_list.each(&:sort!)

adjacency_list.each do |adj|
  puts adj.join(' ')
end

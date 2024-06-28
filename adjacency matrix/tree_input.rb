# 頂点数
n = gets.to_i

# 隣接行列を初期化（全部0のn*nの表を作る）
adj_matrix = Array.new(n) { Array.new(n, 0) }

# 辺の情報を読み込んで、隣接行列に反映する
(n-1).times do
  a, b = gets.split.map(&:to_i)
  adj_matrix[a-1][b-1] = 1
  adj_matrix[b-1][a-1] = 1
end

adj_matrix.each do |row|
  puts row.join(' ')
end
# frozen_string_literal: true

# 偶数の要素は2倍にする
# 奇数の要素は3倍にする
# 5の倍数の要素は、元の値に10を加える
# 上記の条件が重複する場合は、すべての条件を適用する（例：10は偶数かつ5の倍数）
# 新しい配列内の要素が100を超える場合、その要素を100で割った余りに置き換える
# 元の配列は変更せずに、新しい配列を返す必要があります。

def transform_array(arr)
  arr.map do |n|
    transformed_number = apply_rules_to_number(n)
    transformed_number > 100 ? transformed_number % 100 : transformed_number
  end
end

def apply_rules_to_number(n)
  if n.even? && (n % 5).zero?
    n * 2 + 10
  elsif n.odd? && (n % 5).zero?
    n * 3 + 10
  elsif (n % 5).zero?
    n + 10
  elsif n.even?
    n * 2
  elsif n.odd?
    n * 3
  end
end

p transform_array([1, 2, 3, 4, 5, 10, 15, 20])
# 期待される出力: [3, 4, 9, 8, 25, 30, 55, 50]
# OK

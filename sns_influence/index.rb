# 仮
followers = [
  [1, 2],
  [4, 2],
  [2, 4],
  [3, 4],
]

follow_count = followers.map { |follower| follower[1] }

tally_result = follow_count.tally

max_count = tally_result.values.max

smallest_key_with_max_count = tally_result.select { |_, count| count == max_count }.keys.min

puts smallest_key_with_max_count


# FB


# 以下のフィードバックを提供します：

# 良い点
# フォロワー数のカウント: followers.map { |follower| follower[1] }を使用して、フォローされたユーザーのリストを取得しています。これはフォロワー数をカウントするための良いアプローチです。
# フォロワー数の集計: tallyメソッドを使用して、各ユーザーのフォロワー数を集計しています。これは簡潔で効果的な方法です。
# 最大フォロワー数のユーザー特定: max_countを計算し、それに基づいてフォロワー数が最大のユーザーを特定する方法も適切です。
# 改善点
# 重複エントリの処理: 入力に重複するエントリが含まれている場合、それを排除する必要があります。現在のコードでは、重複エントリがそのままカウントされてしまいます。
# 条件付きのフォロワー数の比較: 最小のIDを特定するためにselectメソッドを使用していますが、min_byメソッドを使うことでコードを簡潔にすることができます。
# 改善案
# 以下に改善されたコードを示します：

# ruby
# コードをコピーする
# followers = [
#   [1, 2],
#   [1, 2],
#   [2, 4],
#   [3, 4],
# ]

# # 重複エントリの排除
# unique_followers = followers.uniq

# # フォローされたユーザーのリストを取得
# follow_count = unique_followers.map { |follower| follower[1] }

# # フォロワー数の集計
# tally_result = follow_count.tally

# # 最大フォロワー数の取得
# max_count = tally_result.values.max

# # 最大フォロワー数を持つユーザーIDの最小値を取得
# smallest_key_with_max_count = tally_result.select { |_, count| count == max_count }.keys.min

# puts smallest_key_with_max_count
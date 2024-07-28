followers = [
  [1, 2],
  [1, 2],
  [2, 4],
  [3, 4],
]

follow_count = followers.map { |follower| follower[1] }

tally_result = follow_count.tally

max_count = tally_result.values.max

smallest_key_with_max_count = tally_result.select { |_, count| count == max_count }.keys.min

puts smallest_key_with_max_count

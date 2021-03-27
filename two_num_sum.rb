def two_num_sum(ints, target_sum)
  collector = {}
  ints.each do |int|
    if collector[target_sum - int]
      return [int, target_sum - int]
    else
      collector[int] = true
    end
  end
  return []
end

p two_num_sum([3, 5, -4, 8, 11, 1, -1, 6], 10)
p two_num_sum([4, 6], 10)
p two_num_sum([4, 6, 1], 5)
p two_num_sum([4, 6, 1, -3], 3)
p two_num_sum([1, 2, 3, 4, 5, 6, 7, 8, 9], 17)
p two_num_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 15], 18)
p two_num_sum([-7, -5, -3, -1, 0, 1, 3, 5, 7], -5)
p two_num_sum([-21, 301, 12, 4, 65, 56, 210, 356, 9, -47], 163)
p two_num_sum([-21, 301, 12, 4, 65, 56, 210, 356, 9, -47], 164)
p two_num_sum([3, 5, -4, 8, 11, 1, -1, 6], 15)
p two_num_sum([14], 15)
p two_num_sum([15], 15)
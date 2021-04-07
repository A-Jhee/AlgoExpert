require_relative 'AlgoTestParser'
require 'pry'

def minimumWaitingTime(queries)
  result = 0
  total_queries_left = queries.size - 1
  queries.sort!.each do |query_time|
    result += query_time * total_queries_left
    total_queries_left -= 1
  end
  result
end

# queries = [3, 2, 1, 2, 6]
# p minimumWaitingTime(queries)

# solution = []
test_cases = AlgoTestParser.parse_test('minimumWaitingTime_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p minimumWaitingTime( test_case["queries"] )
  binding.pry
  puts ""
end

# [3, 2, 1, 4, 6] --> [1, 2, 3, 4, 6]


# 0 +1 +3 +6 +10 = 20

#  1     2      3        4          6
# (0) + (1) + (1+2) + (1+2+3) + (1+2+3+4) = 20
# ind = 1

#         arr[ind-1] -> arr[0] = 1
#         result += arr[ind-1]  1 

#         ind += 1 -> 2

#         arr[ind-1] -> arr[1] = 2
#         result += ( arr[ind-1] + result )  4

#         ind += 1 -> 3
#         arr[ind-1] -> arr[2] = 3


#       [0,1]  [0,2]   [0,3]      [0,4]

#       arr.size = 5
#       go only up to 4, (arr.size - 1)


# result = 0
# 1.upto( arr.size - 1 ) do |subarray_length|
#   result += arr[0, subarray_length].reduce(:+)
# end
# result
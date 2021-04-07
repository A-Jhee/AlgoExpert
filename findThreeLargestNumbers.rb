require_relative 'AlgoTestParser'

def findThreeLargestNumbers(array)
  # your code here
end

solution = []
test_cases = AlgoTestParser.parse_test('findThreeLargestNumbers_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p findThreeLargestNumbers( test_case["array"] )
  puts ""
end
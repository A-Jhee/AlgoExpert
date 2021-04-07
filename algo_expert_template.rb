require_relative 'AlgoTestParser'

def function_name(param_name)
  # your code here
end

test_cases = AlgoTestParser.parse_test('function_name_test.txt')

test_cases.each do |test_case|
  p function_name( test_case["param_name"] )
end
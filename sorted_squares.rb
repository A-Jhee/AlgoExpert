require_relative 'AlgoTestParser'

def sortedSquaredArray(array)
  length = array.size
  return [ (array[0] ** 2) ] if length == 1
  result = Array.new(length)
  result_ind = length - 1
  left_ind = 0
  right_ind = length - 1
  # while left_ind <= right_ind
  while result_ind > -1
    if array[left_ind].abs < array[right_ind].abs
      result[result_ind] = array[right_ind] ** 2
      # result.unshift(array[right_ind] ** 2)
      result_ind -= 1
      right_ind -= 1
    else
      result[result_ind] = array[left_ind] ** 2
      # result.unshift(array[left_ind] ** 2)
      result_ind -= 1
      left_ind += 1
    end
  end
  result
end


# def sortedSquaredArray(array)
#   array.map { |num| num ** 2 }.sort
# end

test_cases = AlgoTestParser.parse_test('sorted_squares_test.txt')

test_cases.each do |test_case|
  p sortedSquaredArray( test_case["array"] )
end
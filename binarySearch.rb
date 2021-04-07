=begin

input: an array and an integer
        - array is sorted (ascending)
        - contains integers
        - 2nd argument is target integer
output: an integer
        - indicates the index of the target integer in the input array
        - if not found, then -1

Requirements:
- use binary search algo
- determine if target integer is in input array
- find and return its index
- if not found, return -1

Questions:
- is the input array always sorted ascending?
YES
- can the input array be empty?
NO
- will the input array only ever contain integers?
YES
- can the input array contain negative integers?
NO
- can the target integer be negative?
NO

ALGO:

SET start = 0
SET end = arr.size - 1

loop until start == end
  SET middle = (start + end) / 2

  if target == arr[middle]
    return middle
  elsif target < arr[middle]
    look to the left of middle index
    end = middle
  elsif target > arr[middle]
    look to the right
    start = middle
  end
loop end
return -1

=end

require_relative 'AlgoTestParser'

def binarySearch(array, target)
  start_idx = 0
  end_idx = array.size - 1

  until start_idx > end_idx
    middle_idx = (start_idx + end_idx) / 2

    if target == array[middle_idx]
      return middle_idx
    elsif target < array[middle_idx]
      end_idx = middle_idx - 1
    elsif target > array[middle_idx]
      start_idx = middle_idx + 1
    end
  end
  -1
end

# p binarySearch([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 32)

solution = []
test_cases = AlgoTestParser.parse_test('binarySearch_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p binarySearch( test_case["array"], test_case["target"] )
  puts ""
end
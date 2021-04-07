=begin
input: an array
        - contains either integers or other arrays
output: an integer
        - sum of all the elements within the input array
          but with a special multiplication by depth rule

Req:
- input array is "special"
  - "special" array def:
    - non-empty
    - contains integers or other "special" arrays
- depth of a "special" array is how far nested it is.
  ex) [1], depth of 1
      [1 [2] ], innermost is depth of 2
      [1 [2 [3] ] ], innermost is depth of 3
- product sum of a "special array" is:
  - sum of all of its elements, multiplied by its depth
    ex) [3, 6] = (3 + 6)
        [3, [6, 2]] = (3 + ((6+2)*depth(2)) )

Assumptions:
- if all elements of input array are integers, return the sum

Q's:
- can an integer element be negative? YES


[1, [2, [3, 4]] ]

ALGO:
- traverse down to the inner most array
  - how do i know it's the inner most?
    - when all the elements are integers
  - how should i make the traversal?
    - when an element of an array is an array, i go into that array
- keep track of depth thru each traversal into inner array
  - passed in depth variable into recursive call
- sum of all the elements inside the inner most array
- multiply by depth
- return this result up to the previous recursive call in the stack
  -repeat

productSum(element, depth = 1)

current_sum = 0
input_arr.each |element|
  if element.array?
    current_sum += productSum(element, depth + 1)
  else
    current_sum += element
  end
end

return current_sum * depth

=end

require_relative 'AlgoTestParser'

def productSum(arr, depth = 1)
  sum = 0
  arr.each do |element|
    if element.kind_of?(Integer)
      sum += element
    else
      sum += productSum(element, depth + 1 )
    end
  end
  return sum * depth
end

# p productSum([1, [2, [3, 4]] ])

solution = []
test_cases = AlgoTestParser.parse_test('productSum_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p productSum( test_case["array"] )
  puts ""
end

# ------------------------------------------------------------------------------
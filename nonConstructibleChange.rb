require_relative 'AlgoTestParser'

=begin
input: an array that holds
        - integers
        - positive
        - non-unique (can have repeating integers)
        - no upper limit
        - can be empty

output: an integer that represents
          - the minimum sum that i cannot create with the 
            given integers in the array

for example:
  - given []   #empty array
    returns: 1
  - given [1, 2, 5]
    returns: 4
    what are all the possible sums?
      would i count the integer itself as a possible sum? let's say yes
      1, 2, 3(1+2), ##4##, 5, 6(1+5), 7(2+5), 8(1+2+5)
      4 is not a sum I can make given 1, 2, 5. so returns 4

let's try working from 0 element and up

[] => 1

[n] => 1, unless n == 1, then it's 2
if n = 1, it's 2
if n = 2, it's 1
if n = 3, it's 1
...
if n = 100, it's 1

[m, n] => 
if m is the smaller num of the two, and m = 1,
  if n = 1, then 3
    n == m
  if n = 2, then 4
    n == m+1
  if n = 3, then 2
    n > 2,
  if n = 4, then 2
  if n = 5, then 2
  if n = 100, then 2
if m > 1, then 1, 
  regardless of n's value
  ex) m == 3, n > 3

[l, m, n] => 
like 1, 2, 5

if array.size > 2
  if array.sort[0] != 1
    then 1
  else

### core of the problem lies in the concept of "making change"
### be sure to define this action well, so I don't fall into traps

=end

# def nonConstructibleChange(coins)
#   return 1 if coins.empty?

#   if coins.size == 1
#     if coins.first == 1
#       return 2
#     else
#       return 1
#     end
#   end

#   if coins.size == 2
#     coins.sort!
#     if coins.first == 1
#       case coins.last
#       when 1 then return 3
#       when 2 then return 4
#       else        return 2
#       end
#     end
#   end

#   if coins.size > 2
#     return 1 if coins.min != 1

#     all_possible_sums = []
#     min_change = 1

#     1.upto(coins.size) do |length|
#       all_possible_sums << coins.combination(length).map do |combination|
#         combination.reduce(:+)
#       end
#     end

#     all_possible_sums.flatten!.uniq!.sort!
#     all_possible_sums.each do |num|
#       if min_change == num
#         min_change += 1
#       else
#         return min_change
#       end
#     end
#     return min_change
#   end
# end

def nonConstructibleChange(coins)
  min_change = 0
  coins.sort!

  coins.each do |coin|
    if coin > (min_change + 1)
      return (min_change + 1)
    else
      min_change += coin
    end
  end
  return (min_change + 1)
end

test_cases = AlgoTestParser.parse_test('nonConstructibleChange_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p nonConstructibleChange( test_case["coins"] )
end
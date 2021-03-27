

# non-empty arr of integer and non-empty arr of integer => boolean

# the 2nd arr is compared to 1st

# A and B => boolean

# B is compared to A.
#   for? if B is a subsequence of A
#     what is a subsequence? array containing set of numbers that are
#                            not necessarily adj in the comparison arr, but
#                            appears in the same order.

# result = false

# if conditions are met...
#   result reassigned to true
# end

# special condition 1: if B is same as A, then true
# special condition 2: if B has one number that is in A, then true

# assume looking at each element of B starting at 0 index:
# condition 1: is this number in the A array? if true
# condition 2: is it in order in terms of number before you and after you? if true
#   part of subsequence

# return result

# array A = [5, 1, 22, 25, 6, -1, 8, 10]

# array B = [1, 6, -1, 10] #true

# 0. make a collector = []
# 1. i'm looking at 1.
#   is it in A? A.include?(1)
#     collector.push(1)
#       is there a number in the collector that comes before 1?
#         does it come before 1 in the array A?
#           condition checks if this number's index in Array A is less than
#           index of 1 in Array A.
#           if not, return false

# [5, 1, 22, 25, 6, -1, 8, 8, 10]

# [5, 8, -1, 10] #false
# [1, 6, -1, 10] #true

# def valid_subsequence?(ints, seq)
#   return false if seq.size > ints.size
#   return true if seq.size == 1 && ints.include?(seq[0])

#   collector = []
#   seq.each do |num|
#     new_index = ints.index(num)
#     if new_index
#       if collector[-1]
#         if collector[-1] < new_index
#           collector.push(new_index)
#         else
#           return false
#         end
#       else
#         collector.push(new_index)
#       end
#     else
#       return false
#     end
#   end

#   true
# end

require 'json'
require_relative 'AlgoTestParser'

def valid_subsequence?(ints, seq)
  current_index = 0
  ints.each do |int|
    if int == seq[current_index]
      current_index += 1
    end
  end
  current_index == seq.size
end

test_cases = AlgoTestParser.parse_test('../algo/valid_subseq_test.txt')

test_cases.each do |test_case|
  # p valid_subsequence?( test_case["array"], test_case["sequence"] )
  p test_case
end

# f = File.read('../algo/valid_subseq_test.txt')
# f.gsub!(/Test Case [\d]+/, '')
#  .gsub!(/\n/, '')
#  .gsub!(/}/, '}\n')
# test_cases = f.split('\n').map { |txt_hash| JSON.parse(txt_hash) }

# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 25, 6, -1, 8, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 6, -1, 8, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [22, 25, 6]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, -1, 8, 10]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [25]) == true
# p valid_subsequence?([1, 1, 1, 1, 1], [1, 1, 1]) == true
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 25, 6, -1, 8, 10, 12]) == false
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [4, 5, 1, 22, 25, 6, -1, 8, 10]) == false
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 23, 6, -1, 8, 10]) == false
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [5, 1, 22, 22, 25, 6, -1, 8, 10]) == false
# p valid_subsequence?([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, -1]) == false

# =-=-=-==--=--=
# =-=-=-==--=--=
# =-=-=-==--=--=

# first = [5, 1, 22, 25, 6, -1, 8, 10]
# second = [1, 6, -1, 10]

# collector = []
# - I iterate through second arr
# - see if the element returns a truthy value when first.index(element)
#   - when true, it's new_index. check to see if there is collector[-1]
#     - when true, check if collector[-1] < new_index
#       - when true, push new_index into collector
#     - when false, exit and return false.
# return true


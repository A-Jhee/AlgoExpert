require_relative 'AlgoTestParser'

require 'benchmark'

def getNthFib1(n)
  return 0 if n == 1
  return 1 if n == 2
  return getNthFib1( n - 2 ) + getNthFib1( n - 1 )
end

def getNthFib2(n)
  return 0 if n == 1
  return 1 if n == 2
  two_before_nth_fib = 0
  one_before_nth_fib = 1
  nth_fib = 0
  (3..n).each do |num|
    nth_fib = two_before_nth_fib + one_before_nth_fib
    two_before_nth_fib = one_before_nth_fib
    one_before_nth_fib = nth_fib
  end
  return nth_fib
end

def getNthFib3(n)
  getNthTail(n, 0, 1)
end

def getNthTail(n, two_before, one_before)
  if n == 1
    two_before
  elsif n == 2
    one_before
  else
    getNthTail(n - 1, one_before, two_before + one_before)
  end
end

def getNthFib4(n)
  return 0 if n == 1
  first, last = [0, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end

# solution = []
# test_cases = AlgoTestParser.parse_test('getNthFib_test.txt')

# test_cases.each_with_index do |test_case, ind|
#   puts "Test Case #{ind+1}:"
#   p getNthFib4( test_case["n"] )
#   puts ""
# end

n = 50
Benchmark.bm(28) do |x|
  x.report("F(fib) with recursion") { n.times { getNthFib1(20) } }
  x.report("F(fib) with iteration1") { n.times { getNthFib2(20) } }
  x.report("F(fib) with iteration2") { n.times { getNthFib4(20) } }
  x.report("F(fib) with tail recursion") { n.times { getNthFib3(20) } }

end
require 'benchmark'

puts "Running Ruby #{RUBY_VERSION}"

arr = []
1000.times {
  arr << { bar: rand(1000) }
}

n = 500
Benchmark.bm(20) do |x|
  x.report("sort reverse block") { n.times { arr.sort! { |a,b| b[:bar] <=> a[:bar] } } }
  x.report("sort then reverse!") { n.times { arr.sort! { |a,b| a[:bar] <=> b[:bar] }.reverse! } }
  x.report("sort_by") { n.times { arr.sort_by{ |a| a[:bar] }.reverse! } }
end
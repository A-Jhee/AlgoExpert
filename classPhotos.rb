require_relative 'AlgoTestParser'

def classPhotos(redShirtHeights, blueShirtHeights)
  redShirtHeights.sort! { |a, b| b <=> a }
  blueShirtHeights.sort! { |a, b| b <=> a }

  if redShirtHeights.first == blueShirtHeights.first
    return false
  elsif redShirtHeights.first > blueShirtHeights.first
    return redShirtHeights.each_with_index.all? do |redShirt, ind|
      redShirt > blueShirtHeights[ind]
    end
  else
    return blueShirtHeights.each_with_index.all? do |blueShirt, ind|
      blueShirt > redShirtHeights[ind]
    end
  end
end

solution = []
test_cases = AlgoTestParser.parse_test('classPhotos_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}:"
  p classPhotos( test_case["redShirtHeights"], test_case["blueShirtHeights"] )
  puts ""
end
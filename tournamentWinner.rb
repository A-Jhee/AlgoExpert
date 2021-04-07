require_relative 'AlgoTestParser'

def tournamentWinner(competitions, results)
  result = Hash.new(0)
  winner = ""
  competitions.each_with_index do |teams, ind|
    if results[ind] == 1
      result[teams[0]] += 3
      if result[teams[0]] > result[winner]
        winner = teams[0] 
      end
    else
      result[teams[1]] += 3
      if result[teams[1]] > result[winner]
        winner = teams[1] 
      end
    end
  end
  [result.key(result.values.max), winner]
end



# {
#   "competitions": [
#     ["HTML", "C#"],
#     ["C#", "Python"],
#     ["Python", "HTML"]
#   ],
#   "results": [0, 0, 1]
# }

test_cases = AlgoTestParser.parse_test('tournamentWinner_test.txt')

test_cases.each do |test_case|
  p tournamentWinner( test_case["competitions"], test_case["results"] )
end
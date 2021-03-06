require 'json'

module AlgoTestParser
  def AlgoTestParser.parse_test(filename)
    raw_test_str = File.read(filename)
    raw_test_str.gsub!(/Test Case [\d]+/, '|')
                .gsub!(/\n/, '')
    test_cases = raw_test_str.split('|').map do |raw_test|
      JSON.parse(raw_test)
    end
    test_cases
  end
end
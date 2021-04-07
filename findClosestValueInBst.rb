require_relative 'AlgoTestParser'
require 'json'

=begin
input: binary search tree (BST), target integer
        - BST in the form of Hash
          - keys: nodes, root
            nodes - array of hashes [{}, {}]
              each element has keys: id (str), left (str), right (str), value (int)
            root - single string number
output: single integer
          - a node value in BST, closest to the target integer

* There will only be one closest value
  ? are equivalent values considered the closest possible value
  ? are BST and target number only positive integers
* BST node has properties:
  - "value", an integer
  - node > "left" child node
  - node <= "right" child node
  - child nodes are valid nodes (has these properties) or null

PROBLEM
- How do i navigate the BST?
  - left child is smaller num
  - right child is greater or equal num
  - depending on the current node value and the target num diff, i can
    choose which direction to nagivate to
- How do i find the closest value to target?
  - for each value i'm inspecting, I take the difference between current value - target value
    make note of the current value with the lowest difference
    
  - have a variable that holds the lowest difference so far
    - value is initalized with: abs(target - root node)
      - when the difference is 0, answer is found, return immediately
      - otherwise keep looking at all possible branches


-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=QUARANTINE
left_diff = abs(left value - target)
right_diff = abs(right value - target)

if left_diff < right_diff
  go left
elsif right_diff < left_diff
  go right
else (which is right_diff == left_diff)
  go both ways
end

look at current node value
  current_value = node value
repeat from __DA CAPO__

current_diff = abs(current_value - target)  # will be root the first time

if current_diff < lowest_diff
  lowest_diff = current_diff

* second time going down, see if I need smaller num or greater num
-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=QUARANTINE

PSEUDO-CODE

lowest_diff = abs(root - target)    #2
closest_number = root  #10


__DA CAPO__
current_diff = abs(current_value - target)  # will be root the first time

if current_diff < lowest_diff
  if current_diff == 0 return current_value
  lowest_diff = current_diff
  closest_number = current_value

if current_value < target         # 13 > 12
  peek right node value
    if no node
      return closest_number
    else
      current_value = right node value
elsif current_value > target
  peek left node value
    if no node
      return closest_number
    else
      current_value = left node value
end

go to __DA CAPO__ to loop

=end

# def findClosestValueInBst(tree, target)
#   lowest_diff = (tree["root"].to_i - target).abs
#   closest_number = tree["root"].to_i
#   current_id_str = tree["root"]

#   while
#     current_node = tree["nodes"].find { |node| node["id"] == current_id_str }
#     current_value = current_node["value"]
#     current_diff = (current_value - target).abs

#     if current_diff == 0
#       return current_value
#     elsif current_diff < lowest_diff
#       lowest_diff = current_diff
#       closest_number = current_value
#     end

#     if current_value < target
#       if current_node["right"].nil?
#         return closest_number
#       else
#         current_id_str = current_node["right"]
#       end
#     elsif current_value > target
#       if current_node["left"].nil?
#         return closest_number
#       else
#         current_id_str = current_node["left"]
#       end
#     end
#   end

#   closest_number
# end

def findClosestValueInBst(tree, target)
  closest_number = tree["root"].to_i
  current_id_str = tree["root"]
  return findClosestValueInBstHelper(tree, target, tree["root"].to_i, tree["root"])
end

def findClosestValueInBstHelper(tree, target, closest, current_id_str)
  return closest if current_id_str.nil?

  current_node = tree["nodes"].find { |node| node["id"] == current_id_str }
  current_value = current_node["value"]

  if (target - closest).abs > (target - current_value).abs
    closest = current_value
  end

  if target < current_value
    return findClosestValueInBstHelper(tree, target, closest, current_node["left"])
  elsif target > current_value
    return findClosestValueInBstHelper(tree, target, closest, current_node["right"])
  else
    return closest
  end
end

# test_case_str = <<~TESTCASE
# {
#   "tree": {
#     "nodes": [
#       {"id": "10", "left": "5", "right": "15", "value": 10},
#       {"id": "15", "left": "13", "right": "22", "value": 15},
#       {"id": "22", "left": null, "right": null, "value": 22},
#       {"id": "13", "left": null, "right": "14", "value": 13},
#       {"id": "14", "left": null, "right": null, "value": 14},
#       {"id": "5", "left": "2", "right": "5-2", "value": 5},
#       {"id": "5-2", "left": null, "right": null, "value": 5},
#       {"id": "2", "left": "1", "right": null, "value": 2},
#       {"id": "1", "left": null, "right": null, "value": 1}
#     ],
#     "root": "10"
#   },
#   "target": 12
# }
# TESTCASE
# test_case = JSON.parse(test_case_str)

# p findClosestValueInBst( test_case["tree"], test_case["target"] )

solution = [13, 100, 208, 4500, 4500, -51, 1001, 5, 55000, 1, 55000, 4500]
test_cases = AlgoTestParser.parse_test('findClosestValueInBst_test.txt')

test_cases.each_with_index do |test_case, ind|
  puts "Test Case #{ind+1}: #{findClosestValueInBst( test_case["tree"], test_case["target"] ) == solution[ind]}" 
  # findClosestValueInBst( test_case["tree"], test_case["target"] ) == solution[ind]
end
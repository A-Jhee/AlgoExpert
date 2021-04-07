=begin
- write a class "BST"
  - 3 class instance methods:
    - #insert
      - travels down the BST and inserts a new value as a new "leaf"
        - think of it like replacing a nil value at the end of a BST path
      - it needs to insert where it satisfies "the BST properties"
    - #remove
      - find the first matching node with the passed in argument value,
        and remove from the BST class instance
      - if the BST has only one-node (aka, a single-node tree), calling #remove
        does nothing. do nothing, and return self
      - if the value to be removed cannot be found, return nil
      - if value is successfully removed, return the removed value

      - #remove logic walkthrough
        - passed in 10 as value to #remove method
        - looks for first instance of node value matching 10
        - clear that node's value, so that it's nil
        - a new value needs to occupy this now empty node.
          - new value needs to satisfy BST properties 
          - new value needs be from an existing value within BST

    - #contains
      - works similar to Array#include?
        - returns boolean (true / false) that tells whether
          the BST class instance obj contains the value passed in as argument

"the BST properties"
- each node has an integer value
- left child node, is less than parent node
  - important! a node's value is strictly greater than the
               values of every node to its left
- right child node, is greater than equal to parent node
- all nodes are either valid BST nodes, or nil


INSERT LOGIC
- instantiate new BST class instance object with its value
  root = BST.new(10)
- it has no left or right child
- try to insert a new value
  root.insert(15)
- compare the new insert value against node value
  if new_val < value
    root.left = new_val
  if new_val >= value
    root.right = new_val
- insert 15 into root.right
- insert a new value
  root.insert(5)
- compare the values again
  new_val < value
    root.left = 5
- insert a new value
  root.insert(13)
- compare the values again
  13 >= 10
    if root.right.nil?
      root.right = 13
    else
      traverse to root's right child node
      - root_right.value = 15
      - compare 13 with 15
          if new_val < value
            root_right.left = new_val
          if new_val >= value
            root_right.right = new_val
      - 13 < 15
          if root_right.left.nil?
            root_right.left = 13

two logic repeats here:

- compare the new insert value against the current node value
  if new value is less than,
    traverse to left chid
  if new value is greater than or equal to,
    traverse to right child

- check if current node's value is nil
  if so, new value is inserted here

    else, __DA CAPO__
    make the comparison from above again to repeat

                  10
                 /   \
                5    15
               / \   / \
            nil   5 13 22
            /       / \
          nil     nil  nil

INSERT PSEUDO CODE

node = BST.new(10)
# node.left == nil
# node.right == nil
node.insert(5)

current_node = self

while !current_node.nil?
  if new_value < self.value
    if self.left.nil?
      self.left = new_value
      return self
    else
      current_node = self.left
    end
  elsif new_value >= self.value
    if self.right.nil?
      self.right = new_value
      return self
    else
      current_node = self.right
    end
  end
end

REMOVE LOGIC
                  10
                 /   \
                5    15
               / \   / \
              2   5 13  22
            /         \
          1           14

remove(10)
- find 10
  - 10 is found, it's root node
- clear 10 from node
  - node is now nil 

                  nil
                 /   \
                5    15
               / \   / \
              2   5 13  22
            /       / \
          1        12  14

- find a new value to fill node
  - do i have a parent node?
    no
  - do i have child nodes?
    yes: 5, 15
    - I need to be a value between 6~15
      - eliminates left branch, always eliminates left
    - look to right child node
    - value is 15
      - the node <= 15. so do not consider right child node of 15
      - always look left 
      - value is 13
        - this value satisfies properties for the node
        - does it have child nodes?
          - yes: 12, 14
          - 14 is not appropriate, since choosing 14 makes it not
            strictly greater than or equal to every node to its right
          - travel to 12
            - does it have child nodes?
              - no
                - return 12 and insert 12 into the node.


def remove(target_value)
  current_node = self

  until current_node.nil?
    if target_value == current_node.value
      delete_value(target_value)
    elsif target_value < current_node.value
      current_node = current_node.left
    else
      current_node = current_node.right
    end
  end
end



CONTAINS LOGIC

                  10
                 /   \
                5    15
               / \   / \
              2   5 13  22
            /      /  \
          1       12  14

contains(check_val)

check_val = 5

current_node = self

__DA CAPO__
check_val == current_node.value
  return true
check_val < current_node.value
  current_node = current_node.left
check_val >= current_node.value
  current_node = current_node.right
__DA CAPO__

BST.left = BST.new(v)
so and so forth, creating a linked list of BST class instances

  def contains(check_value)
    current_node = self

    loop
      if check_value == current_node.value
        return true
      elsif check_value < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
      break if current_node.nil?
    end

    return false
  end

=end

require_relative 'AlgoTestParser'
require 'pry'
require 'json'

class BST
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(new_value)
    current_node = self

    while !current_node.nil?
      if new_value < current_node.value
        if current_node.left.nil?
          current_node.left = BST.new(new_value)
          break
        else
          current_node = current_node.left
        end
      elsif new_value >= current_node.value
        if current_node.right.nil?
          current_node.right = BST.new(new_value)
          break
        else
          current_node = current_node.right
        end
      end
    end
    nil
  end

  def remove(target_value, parent_node = nil)
    current_node = self

    while !current_node.nil?
      if target_value < current_node.value
        parent_node = current_node
        current_node = current_node.left
      elsif target_value > current_node.value
        parent_node = current_node
        current_node = current_node.right
      else
        if !current_node.left.nil? && !current_node.right.nil?
          current_node.value = current_node.right.get_min_value
          current_node.right.remove(current_node.value, current_node)
        elsif parent_node.nil?
          if !current_node.left.nil?
            current_node.value = current_node.left.value
            current_node.right = current_node.left.right
            current_node.left = current_node.left.left
          elsif !current_node.right.nil?
            current_node.value = current_node.right.value
            current_node.left = current_node.right.left
            current_node.right = current_node.right.right
          else
            return
          end
        elsif parent_node.left == current_node
          if !current_node.left.nil?
            parent_node.left = current_node.left
          else
            parent_node.left = current_node.right
          end
        elsif parent_node.right == current_node
          if !current_node.left.nil?
            parent_node.right = current_node.left
          else
            parent_node.right = current_node.right
          end
        end
      end
    end
  end

  def get_min_value
    current_node = self
    while !current_node.left.nil?
      current_node = current_node.left
    end
    return current_node.value
  end

  def contains(check_value)
    current_node = self

    loop do
      if check_value == current_node.value
        return true
      elsif check_value < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
      break if current_node.nil?
    end

    return false
  end

  def print
    puts "%5d" % [value]
    puts "   / \\"
    if left.nil? && right.nil?
      puts "nil   nil"
    elsif left.nil?
      puts "nil   %2d" % [right.value]
    elsif right.nil?
      puts " %2d   nil" % [left.value]
    else
      puts " %2d   %2d" % [left.value, right.value]
    end
  end
end

test_case_str = <<~TESTCASE
{
  "rootValue": 1,
  "classMethodsToCall": [
    {
      "arguments": [4],
      "method": "insert"
    },
    {
      "arguments": [5],
      "method": "insert"
    },
    {
      "arguments": [6],
      "method": "insert"
    },
    {
      "arguments": [7],
      "method": "insert"
    },
    {
      "arguments": [8],
      "method": "insert"
    },
    {
      "arguments": [9],
      "method": "insert"
    },
    {
      "arguments": [10],
      "method": "insert"
    }
  ]
}
TESTCASE
# test_case = JSON.parse( test_case_str )

# root = BST.new(1)

# root.left = BST.new(2)
# #
# root.left.left = BST.new(4)
# root.left.right = BST.new(5)
# root.left.left.left = BST.new(8)
# root.left.left.right = BST.new(9)
# # root.left.right.left = BST.new(10)
# #
# root.right = BST.new(3)
# root.right.left = BST.new(6)
# root.right.right = BST.new(7)

# root.left.print
# root.left.left.print
# root.left.right.print
# root.left.left.left.print
# root.left.left.right.print
# root.left.right.left.print

# root.right.print
# root.right.left.print
# root.right.right.print

# test_case["classMethodsToCall"].each do |method_call|
#   root.send( method_call["method"], method_call["arguments"].first )
# end

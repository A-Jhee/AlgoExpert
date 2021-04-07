class Node
  attr_accessor :children, :name

  def initialize(node_name)
    @children = []
    @name = node_name
  end

  def add_child(child_name)
    children << Node.new(child_name)
    return self
  end

  def depthFirstSearch(array)

    array << self.name
    children.each do |child_node|
      child_node.depthFirstSearch(array)
    end
    return array
  end
end

root = Node.new('A')
root.add_child('B').add_child('C').add_child('D')

node_b = root.children[0]
node_b.add_child('E').add_child('F')

node_f = node_b.children[1]
node_f.add_child('I').add_child('J')

node_d = root.children[2]
node_d.add_child('G').add_child('H')

node_g = node_d.children[0]
node_g.add_child('K')

arr = []
root.depthFirstSearch(arr)
p arr
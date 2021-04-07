require_relative 'bst'

def nodeDepths(root, depth = 0)
  return 0 if root.nil?
  return depth + nodeDepths(root.left, depth + 1) + nodeDepths(root.right, depth + 1)
end


root = BST.new(1)

root.left = BST.new(2)
#
root.left.left = BST.new(4)
root.left.right = BST.new(5)
root.left.left.left = BST.new(8)
root.left.left.right = BST.new(9)
#
root.right = BST.new(3)
root.right.left = BST.new(6)
root.right.right = BST.new(7)

p nodeDepths(root)
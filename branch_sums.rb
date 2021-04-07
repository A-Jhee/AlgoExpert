require_relative 'bst'

def branchSums(root)
  result = []
  recursiveBranchSums(root, 0, result)
  return result
end

def recursiveBranchSums(node, current_sum, result)
  return if node.nil?

  new_sum = current_sum + node.value
  if node.left.nil? && node.right.nil?
    result << new_sum
    return
  end

  recursiveBranchSums(node.left, new_sum, result)
  recursiveBranchSums(node.right, new_sum, result)
end
//: [Previous](@previous)

import Foundation

//  Problem 1341
//        Given a binary tree, determine whether or not it is height-balanced.
//        A height-balanced binary tree can be defined as one in
//        which the heights of the two subtrees of any node never differ by more than one.

// DPF

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    return checkHeightBalanced(root) != -1
}

func checkHeightBalanced(_ root: TreeNode?) -> Int {
    guard let node = root else {
        return 0
    }

    let leftHeight = checkHeightBalanced(node.left)
    let rightHeight = checkHeightBalanced(node.right)

    // If any subtree is unbalanced, return -1 immediately
    if leftHeight == -1 || rightHeight == -1 {
        return -1
    }

    // If the height difference between left and right subtrees is greater than 1, return -1
    if abs(leftHeight - rightHeight) > 1 {
        return -1
    }

    // Return the height of the current subtree
    return max(leftHeight, rightHeight) + 1
}

// Example usage:
let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

print(isBalanced(root)) // Output: true


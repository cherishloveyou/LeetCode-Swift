/**
 * Question Link: https://leetcode.com/problems/invert-binary-tree/
 * Primary idea: recursion, swap left and right of current node each time
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class InvertBinaryTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        (root.left, root.right) = (root.right, root.left)
        
        invertTree(root.left)
        invertTree(root.right)
        
        return root
    }
}
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        dfs(root)
        return root
    }

    func dfs(_ node: TreeNode?) {
        guard let node = node else {return}
        var temp = node.left
        node.left = node.right
        node.right = temp
        dfs(node.left)
        dfs(node.right)
    }
}
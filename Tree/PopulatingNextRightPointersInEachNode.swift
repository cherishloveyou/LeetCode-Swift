/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/
 * Primary idea: use the idea of maximum depth of a binary tree
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

class BalancedBinaryTree {
    func connect(_ root: Node?) -> Node? {
        var levelStart = root
        while (levelStart != nil){
            var cur = levelStart
            while (cur != nil){
                if (cur?.left != nil){
                    cur?.left?.next = cur?.right
                }
                if (cur?.right != nil && cur?.next != nil) {
                    cur?.right?.next = cur?.next?.left
                }
                cur = cur?.next
            }
            levelStart = levelStart?.left
        }
        return root
    }
}
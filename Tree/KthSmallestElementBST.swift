/**
 * Question Link: https://leetcode.com/problems/kth-smallest-element-in-a-bst/
 * Primary idea: use stack to do inorder traverse and track k to find answer
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

 class KthSmallestElementBST {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode](), currentNode = root, k = k
        
        while !stack.isEmpty || currentNode != nil {
            if currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode!.left
            } else {
                let node = stack.removeLast()
                k -= 1
                
                if k == 0 {
                    return node.val
                }
                
                currentNode = node.right
            }
        }
        
        return -1
    }
}

class Solution {
    var currentCount: Int = 0
    var findNode: TreeNode? = nil
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        dfs(root, k)
        return findNode!.val
    }
    
    func dfs(_ node: TreeNode?, _ k: Int) {
        if node?.left == nil && node?.right == nil {
            currentCount += 1
            
            if currentCount == k {
                findNode = node
            }
            return
        }
        
        if node?.left != nil {
            dfs(node?.left, k)
        }
        
        if findNode != nil {
            return
        }
        
        currentCount += 1
        
        if currentCount == k {
            findNode = node
            return
        }
        
        if node?.right != nil {
            dfs(node?.right, k)
        }
    }
}
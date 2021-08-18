/**
 * Question Link: https://leetcode.com/problems/binary-tree-level-order-traversal/
 * Primary idea: use a queue to help hold TreeNode, and for each level add a new Int array
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
 
class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        
        guard let root = root else {
            return res
        }
        
        var currentLevel = [root]
        
        while !currentLevel.isEmpty {
            let currentLevelVals = currentLevel.map { $0.val }
            
            // add current level vals
            res.append(currentLevelVals)
            
            // add next level nodes
            currentLevel = currentLevel.flatMap { [$0.left, $0.right] }.compactMap { $0 }
        }
        
        return res
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
  
        dfs(root, &res, 0)
        return res
    }

    func dfs(_ root: TreeNode?,_ res: inout [[Int]],_ level: Int) {
        guard let r = root else { return }
        if level < res.count {
            res[level].append(r.val)
        } else {
            res.append([r.val])
        }
        dfs(r.left, &res, level+1)
        dfs(r.right, &res, level+1)
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        var queue: [TreeNode] = [root]
        var result: [[Int]] = []
        while !queue.isEmpty {
            var path: [Int] = []
            for i in 0..<queue.count {
                let head = queue.removeFirst()
                path.append(head.val)
                if let leftNode = head.left {
                    queue.append(leftNode)
                }
                if let rightNode = head.right {
                    queue.append(rightNode)
                }
            }
            result.append(path)
        }
        return result
    }
}
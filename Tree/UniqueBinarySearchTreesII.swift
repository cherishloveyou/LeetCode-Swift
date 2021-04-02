/**
 * Question Link: https://leetcode.com/problems/unique-binary-search-trees-ii/
 * Primary idea: recursion
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 * Copyright © 2016 YiGu. All rights reserved.
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

class UniqueBinarySearchTreesII {

    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [] }
        return build(1, n)
    }

    func build(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]    
        }
        if start == end {
            return [TreeNode(start)]
        }
        var results: [TreeNode?] = []
        for i in start...end {
            var left = build(start, i-1)
            var right = build(i+1, end)
            for lNode in left {
                for rNode in right {
                    results.append(TreeNode(i, lNode, rNode))
                }
            }
        }
        return results
    }
}
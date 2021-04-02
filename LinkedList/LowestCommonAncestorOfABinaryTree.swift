/**
 * Question Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * Primary idea: Use linked list and hash map to build the cache.
 * Time Complexity Per Action: O(1), Space Complexity: O(K)
 *
 */

class InsertionSortList {
	func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left == nil && right == nil {
            return nil
        }
        if left != nil && right != nil {
            return root
        }
        return left ?? right
    }
}

    
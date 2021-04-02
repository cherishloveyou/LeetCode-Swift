/**
 * Question Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 * Primary idea: Use linked list and hash map to build the cache.
 * Time Complexity Per Action: O(1), Space Complexity: O(K)
 *
 */

class InsertionSortList {
	func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        guard let p = p, let q = q else {
            return nil
        }
        if root.val > p.val && root.val > q.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        if root.val < p.val && root.val < q.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        return root
    }
}

    
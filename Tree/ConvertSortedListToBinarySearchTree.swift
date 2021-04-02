/**
 * Question Link: https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
 * Primary idea: Keep min to go right and keep max to go left
 * Time Complexity: O(n), Space Complexity: O(log n)
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

class ConvertSortedListToBinarySearchTree {
   func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }
        var root = head
        var nums = [Int]()
        while root != nil {
            nums.append(root!.val)
            root = root?.next
        }
        return helper(nums, 0, nums.count - 1)
    }
    func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil 
        }
        let mid = (left + right) / 2
        let node = TreeNode(nums[mid])
        node.left = helper(nums, left, mid - 1)
        node.right = helper(nums, mid + 1, right)
        return node
    }
}

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil{
            return TreeNode(head!.val)
        }
        var fast = head
        var slow = head
        var middle = head
        while fast?.next != nil && fast?.next?.next != nil {
            middle = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        fast = slow?.next
        let root = TreeNode(slow!.val)
        if head!.val != slow!.val {
            middle?.next = nil
            root.left = sortedListToBST(head)
        }
        root.right = sortedListToBST(fast)
        return root
    }
}
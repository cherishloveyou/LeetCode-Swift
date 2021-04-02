/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 * Primary idea: Iterate the list, jump over duplicates by replacing next with next.next
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class RemoveDuplicatesFromSortedList {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var curt:ListNode? = head

        while curt != nil && curt?.next != nil {
            if curt?.val == curt?.next?.val {
                curt?.next = curt?.next?.next
            } else {
                curt = curt?.next
            }
        }
        return head
    }
}
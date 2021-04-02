/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list-ii/
 * Primary idea: Use two helper nodes, traverse the linkedlist and change point direction each time
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

class ReverseLinkedListII {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dump = ListNode(-1)
        dump.next = head
        var g: ListNode? = dump
        var p: ListNode? = head
        var step = 0
        while (step < (left - 1)) {
            g = g?.next
            p = p?.next
            step += 1
        }

        for i in 0..<(right - left) {
            var removed = p?.next
            p?.next = p?.next?.next

            removed?.next = g?.next
            g?.next = removed
        }

        return dump.next
    }
}
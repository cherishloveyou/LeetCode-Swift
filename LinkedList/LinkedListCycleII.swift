/**
 * Question Link: https://leetcode.com/problems/swap-nodes-in-pairs/
 * Primary idea: Three Pointers, each time change pointers' directions 
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

class LinkedListCycleII {
   func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head?.next
        var fast = head?.next?.next
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next?.next
        }
        if slow == nil {
            return nil
        }
        var m = head
        while m !== slow {
            m = m?.next
            slow = slow?.next
        }
        return m
    }
}
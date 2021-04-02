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

class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow != nil
    }
}
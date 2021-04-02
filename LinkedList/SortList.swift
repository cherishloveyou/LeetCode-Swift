/**
 * Question Link: https://leetcode.com/problems/insertion-sort-list/
 * Primary idea: Use linked list and hash map to build the cache.
 * Time Complexity Per Action: O(1), Space Complexity: O(K)
 *
 */

class SortList {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        var slow = head
        var fast = head?.next
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let new = slow?.next
        slow?.next = nil
        return mergeTwoLists(sortList(head), sortList(new))
    }

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
}
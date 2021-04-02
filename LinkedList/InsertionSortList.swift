/**
 * Question Link: https://leetcode.com/problems/insertion-sort-list/
 * Primary idea: Use linked list and hash map to build the cache.
 * Time Complexity Per Action: O(1), Space Complexity: O(K)
 *
 */

class InsertionSortList {
	
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head

        var lastSorted = head
        var currentNode = head?.next

        while currentNode != nil {
            if lastSorted!.val <= currentNode!.val {
                lastSorted = lastSorted?.next
            } else {
                var pre = dummy
                while pre.next!.val <= currentNode!.val {
                   pre = pre.next!
                }
                lastSorted?.next = currentNode?.next
                currentNode?.next = pre.next
                pre.next = currentNode
            }
            currentNode = lastSorted?.next
        }
        return dummy.next
    }
}
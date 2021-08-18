/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/
 * Primary idea: use the idea of maximum depth of a binary tree
 * Time Complexity: O(n), Space Complexity: O(n)
 * 
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class BalancedBinaryTree {
    func connect(_ root: Node?) -> Node? {
        dfs(root, nil);
        return root;
    }

    func dfs(_ root: Node?, _ nxtRight: Node?) {
        if(root == nil) {
            return
        }
        var root = root
        root?.next = nxtRight
        var nxtRightForRight: Node? = nil
        var curr = root?.next
        while(curr != nil) {
            if(curr?.left != nil) {
                nxtRightForRight = curr?.left
                break;
            } else if(curr?.right != nil) {
                nxtRightForRight = curr?.right
                break
            }
            curr = curr?.next
        }
        dfs(root?.right, nxtRightForRight)
        dfs(root?.left, root?.right == nil ? nxtRightForRight : root?.right)
    }
}


class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        var cur: Node? = root
        while cur != nil {
            let next = Node(-1)
            var pre: Node? = next

            while cur != nil {
                if cur?.left != nil {
                    pre?.next = cur?.left
                    pre = pre?.next
                }
                if cur?.right != nil {
                    pre?.next = cur?.right
                    pre = pre?.next
                }
                cur = cur?.next
            }
            
            cur = next.next
        }
        return root
    }
}
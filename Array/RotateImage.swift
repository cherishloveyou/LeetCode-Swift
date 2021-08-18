/**
 * Question Link: https://leetcode.com/problems/rotate-image/
 * Primary idea: Go from clockwise and from outside to inside, use offset for convenience
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */

class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        for layer in 0..<n / 2 {
            let start = layer, end = n - layer - 1
            for i in start..<end {
                let offset = i - start
                
                (matrix[start][i], matrix[i][end], matrix[end][end - offset], matrix[end - offset][start]) = (matrix[end - offset][start], matrix[start][i], matrix[i][end], matrix[end][end - offset])
            }
        }
    }
}

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        for i in 0..<n/2 {
           for j in 0..<n {
              (matrix[i][j], matrix[n - i - 1][j]) = (matrix[n - i - 1][j], matrix[i][j])
           }
        }
        
        for i in 0..<n {
           for j in 0..<i {
              (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
           }
        }
    }
}
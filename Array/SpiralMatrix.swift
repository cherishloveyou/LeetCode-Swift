/**
 * Question Link: https://leetcode.com/problems/spiral-matrix/
 * Primary idea: Use four index to get the right element during iteration
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */

class SpiralMatrix {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
    
        guard matrix.count != 0 else {
            return res
        }
    
        var startX = 0
        var endX = matrix.count - 1
        var startY = 0
        var endY = matrix[0].count - 1
        
        while true {
            // top
            for i in startY...endY {
                res.append(matrix[startX][i])
            }
            startX += 1
            if startX > endX {
                break
            }
            
            // right
            for i in startX...endX {
                res.append(matrix[i][endY])
            }
            endY -= 1
            if startY > endY {
                break
            }
            
            // bottom
            for i in stride(from: endY, through: startY, by: -1) {
                res.append(matrix[endX][i])
            }
            endX -= 1
            if startX > endX {
                break
            }
            
            // left
            for i in stride(from: endX, through: startX, by: -1) {
                res.append(matrix[i][startY])
            }
            startY += 1
            if startY > endY {
                break
            }
        }
        
        return res
    }
}

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var top = 0, left = 0, bottom = matrix.count - 1, right = matrix[0].count - 1

        while left <= right && top <= bottom {
            // 第一步：top: 从左到右遍历 left -> right
            for column in left...right {
                res.append(matrix[top][column])
            }
            
            // 第二步：right: 从上到下遍历 top+1 -> bottom
            if top < bottom {
                for row in top+1...bottom {
                   res.append(matrix[row][right])
                }
            }
            
            if left < right && top < bottom {
                // 第三步：bottom：从右到左遍历 right-1 -> left+1
                for column in (left+1..<right).reversed() {
                    res.append(matrix[bottom][column])
                }
                
                // 第四步：left：从下到上遍历 bottom -> top+1
                for row in (top+1...bottom).reversed() {
                    res.append(matrix[row][left])
                }
            }
            
            top += 1
            left += 1
            bottom -= 1
            right -= 1
        }
        return res
    }
}
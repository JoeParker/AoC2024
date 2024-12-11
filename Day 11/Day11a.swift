import Foundation

func day11a(input: String) -> Int {
    var stones = input
        .components(separatedBy: " ")
        .compactMap(Int.init)
    
    (1...25).forEach { _ in
        var i = 0
        while i < stones.count {
            switch true {
            case stones[i] == 0:
                stones[i] = 1
            case String(stones[i]).count % 2 == 0:
                let str = String(stones[i])
                let half = str.count / 2
                stones.insert(Int(str.dropLast(half))!, at: i)
                stones[i + 1] = Int(str.dropFirst(half))!
                i += 1
            default:
                stones[i] = stones[i] * 2024
            }
            i += 1
        }
    }
    
    return stones.count
}

let input = "554735 45401 8434 0 188 7487525 77 7"

print(day11a(input: input)) // 209412

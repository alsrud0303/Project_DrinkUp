import Foundation

// 한 번의 물 섭취 기록을 나타냄

struct WaterRecord: Identifiable, Codable {
    var id = UUID()         // 각 기록을 구분할 고유 ID
    let time: Date          // 물을 마신 시각
    let amount: Int         // 마신 양 (ml)
}

import Foundation

/// 하루 물 섭취 데이터를 나타내는 구조체
struct DailyWaterData: Codable {
    var goal: Int                    // 하루 목표량
    var total: Int = 0               // 총 섭취량, 기본값 0
    var records: [WaterRecord] = []  // 기록 리스트, 기본값 빈 배열
}

import Foundation
import SwiftUI

/// 하루 물 섭취 데이터를 관리하는 클래스
/// ObservableObject → SwiftUI에서 @Published를 통해 UI 업데이트 가능
class WaterDataManager: ObservableObject {
    @Published var dailyData: DailyWaterData   // 현재 하루 데이터

    /// 초기화 시 goal을 선택할 수 있음, default 2000ml
    init(goal: Int = 2000) {
        // total과 records는 DailyWaterData 구조체에서 기본값 사용
        self.dailyData = DailyWaterData(goal: goal)
    }

    /// 새로운 물 섭취 기록 추가
    /// amount: 추가할 섭취량(ml)
    func addWater(amount: Int) {
        let record = WaterRecord(time: Date(), amount: amount)
        dailyData.records.append(record)  // 기록 리스트에 추가
        dailyData.total += amount         // 총 섭취량 업데이트
    }

    /// 하루 데이터 초기화 (goal은 그대로 유지)
    func resetDailyData() {
        dailyData = DailyWaterData(goal: dailyData.goal)
    }
}

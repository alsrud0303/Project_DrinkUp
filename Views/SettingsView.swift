import SwiftUI

/// 설정 화면
/// 하루 목표량 변경 기능 제공
struct SettingView: View {
    @ObservedObject var manager: WaterDataManager   // ContentView에서 전달받은 manager
    @State private var newGoal: String = ""         // TextField 입력값

    var body: some View {
        Form {
            Section(header: Text("하루 목표 설정")) {
                HStack {
                    TextField("목표량 입력 (ml)", text: $newGoal)
                        .keyboardType(.numberPad)
                    
                    Button("저장") {
                        // 입력값이 Int로 변환 가능하고 0보다 큰 경우만 적용
                        if let goal = Int(newGoal), goal > 0 {
                            manager.dailyData.goal = goal
                            newGoal = ""  // 입력창 초기화
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                // 현재 목표 표시
                Text("현재 목표: \(manager.dailyData.goal)ml")
            }
        }
        .navigationTitle("설정")
        .padding()
    }
}

import SwiftUI

/// 앱 메인 화면
/// 목표량 확인, 섭취 기록 추가, 리스트 확인, 초기화 기능 제공
struct ContentView: View {
    @StateObject private var manager = WaterDataManager()   // WaterDataManager 인스턴스
    @State private var drinkAmount: String = ""            // TextField 입력값

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // 오늘 목표 표시
                Text("오늘 목표: \(manager.dailyData.goal)ml")
                    .font(.title2)
                
                // 총 섭취량 표시
                Text("총 섭취: \(manager.dailyData.total)ml")
                    .font(.headline)
                
                // 진행률 프로그레스바
                ProgressView(value: Double(manager.dailyData.total),
                             total: Double(manager.dailyData.goal))
                    .padding()

                // 물 섭취량 입력 및 추가 버튼
                HStack {
                    TextField("물 섭취량 입력 (ml)", text: $drinkAmount)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                    
                    Button("추가") {
                        // 입력값이 Int로 변환 가능하고 0보다 큰 경우에만 추가
                        if let amount = Int(drinkAmount), amount > 0 {
                            manager.addWater(amount: amount)
                            drinkAmount = ""  // 입력창 초기화
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

                // 오늘 섭취 기록 리스트
                List(manager.dailyData.records) { record in
                    HStack {
                        Text(record.time, style: .time)  // 기록 시간 표시
                        Spacer()
                        Text("\(record.amount)ml")       // 기록 섭취량 표시
                    }
                }

                // 하루 데이터 초기화 버튼
                Button("하루 초기화") {
                    manager.resetDailyData()
                }
                .foregroundColor(.red)
                .padding(.top)
            }
            .padding()
            .navigationTitle("DrinkUp")
            .toolbar {
                // 설정 화면으로 이동
                NavigationLink("설정", destination: SettingView(manager: manager))
            }
        }
    }
}

//
//  ContentView.swift
//  Maybe
//
//  Created by 시모니 on 1/15/24.
//

import SwiftUI


struct FindView: View {
    
    @StateObject private var viewmodel = ViewModel()
    @State private var shouldShowAlert = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                
                Text("찾고있는 물건의 정보가 필요해요🧐")
                    .font(.system(size: 25 , weight: .bold))
                
                VStack {
                    HStack {
                        Text("분실 날짜")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    
                    DatePicker("Select a date", selection: $viewmodel.selectedDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                    Text("선택된 날짜는 \(viewmodel.formattedDate)  입니다.")
                }
                
                VStack {
                    HStack {
                        Text("분실품 종류")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    
                    Picker("물품 카테고리", selection: $viewmodel.selectedCategory) {
                        ForEach(viewmodel.categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                if let year = Calendar.current.dateComponents([.year], from: viewmodel.selectedDate).year, year >= 2008 {
                    NavigationLink(
                        destination: FindListView(viewmodel: viewmodel),
                        label: {
                            Text("찾아보기🔍")
                                .font(.system(size: 30 , weight: .bold))
                                .foregroundColor(.black)
                                .frame(width: 200 , height: 100)
                                .background(.pink)
                                .cornerRadius(20)
                        }
                    )
                } else {
                    Button(action: {
                        shouldShowAlert = true
                    }) {
                        Text("찾아보기🔍")
                            .font(.system(size: 30 , weight: .bold))
                            .foregroundColor(.black)
                            .frame(width: 200 , height: 100)
                            .background(.pink)
                            .cornerRadius(20)
                    }
                }
            }
            .alert(isPresented: $shouldShowAlert) {
                Alert(
                    title: Text("주의"),
                    message: Text("2008년 부터 검색이 가능합니다."),
                    dismissButton: .default(Text("확인"))
                )
            }
            .onAppear {
                
                if let year = Calendar.current.dateComponents([.year], from: viewmodel.selectedDate).year, year < 2008 {
                    shouldShowAlert = true
                }
            }
            .padding()
        }
    }
    
}

#Preview {
    FindView()
}

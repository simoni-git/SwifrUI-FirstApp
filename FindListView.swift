//
//  FindListView.swift
//  Maybe
//
//  Created by 시모니 on 1/15/24.
//

import SwiftUI
import Alamofire

struct FindListView: View {
    
    @ObservedObject  var viewmodel: ViewModel
    @State var data: String = ""
    
    var body: some View {
        
            List(viewmodel.lostAndFoundItems ) {  item in
                FindRow(item: item)
                    .frame(height: 80)
                    .onTapGesture {
                        viewmodel.selectedItem = item
                    }
            }
            .onAppear() {
                viewmodel.fetchData()
            }
            .navigationTitle("분실물 목록")
            .sheet(item: $viewmodel.selectedItem) { selectedItem in
                FindDetailView(item: selectedItem)
            }
            .overlay(
                       viewmodel.lostAndFoundItems.isEmpty ? AnyView(NothingView()) : AnyView(EmptyView())
                   )
        }
    }

//#Preview {
//    FindListView()
//}

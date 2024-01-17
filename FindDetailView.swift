//
//  FindDetailView.swift
//  Maybe
//
//  Created by 시모니 on 1/15/24.
//

import SwiftUI

struct FindDetailView: View {
    
    let item: LostAndFoundItem
    
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HStack {
                Spacer()
                HStack {
                    Text("분실물명:")
                    Text("\(item.getName)")
                }
                
                Spacer()
                HStack {
                    Text("카테고리:")
                    Text("\(item.cate)")
                }
                Spacer()
            }
            .font(.system(size: 20 , weight: .bold))
            
            HStack {
                Spacer()
                HStack {
                    Text("등록일자:")
                    Text("\(item.regDate)")
                }
                Spacer()
                HStack {
                    Text("상태:")
                    Text("\(item.status)")
                }
                Spacer()
            }
            .font(.system(size: 20 , weight: .bold))
            
            Text("\(item.getThing)")
            Spacer()
            Text("분실물등록: \(item.takeID)")
                .font(.system(size: 20 , weight: .bold))
            Spacer()
        }
        .padding()
    }
    
}

//#Preview {
//    FindDetailView()
//}

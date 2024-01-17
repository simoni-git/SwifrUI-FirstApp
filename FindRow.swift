//
//  FindRow.swift
//  Maybe
//
//  Created by 시모니 on 1/15/24.
//

import SwiftUI

struct FindRow: View {
    
    let item: LostAndFoundItem
    
    func getTextColor(for status: String) -> Color {
        switch status {
        case "보관":
            return .yellow
        case "경찰서이관":
            return .blue
        case "수령":
            return .green
        default:
            return .black
        }
    }
    
    var body: some View {
        HStack {
            HStack {
                Text("분실물명:")
                    .font(.system(size: 25 , weight: .bold))
                Text("\(item.getName)")
                    .font(.system(size: 20 , weight: .bold))
            }
            
            HStack {
                Text("상태:")
                    .font(.system(size: 25 , weight:  .bold))
                Text("\(item.status)")
                    .font(.system(size: 20 , weight:  .bold))
                    .foregroundColor(getTextColor(for: item.status))
                
            }
        }
    }
    
}

//#Preview {
//    FindRow()
//}


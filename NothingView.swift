//
//  NotthingView.swift
//  Maybe
//
//  Created by 시모니 on 1/16/24.
//

import SwiftUI

struct NothingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "xmark.seal.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100 , height: 100)
            Text("찾으려는 물건이 없습니다. 날짜와 카테고리를 다시 선택해주세요.")
        }
            .font(.system(size: 30 , weight:  .bold))
            .padding()
    }
        
}

#Preview {
    NothingView()
}

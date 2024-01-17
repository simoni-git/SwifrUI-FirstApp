//
//  ViewModel.swift
//  Maybe
//
//  Created by 시모니 on 1/16/24.
//

import Foundation
import Alamofire

class ViewModel: ObservableObject {
    
    @Published var lostAndFoundItems: [LostAndFoundItem] = []
    @Published var selectedItem: LostAndFoundItem?
    @Published var category: String = ""
    @Published  var selectedDate = Date()
    @Published  var selectedCategory = "핸드폰"
    
    let categories = ["핸드폰", "지갑" , "가방", "베낭" , "서류봉투", "쇼핑백" ,"책" , "옷" , "기타"]
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: selectedDate)
        
        return dateString
    }
    
    var shouldShowAlert: Bool {
        
        if let year = Calendar.current.dateComponents([.year], from: selectedDate).year, year < 2008 {
            return true
        } else {
            return false
        }
    }
    
    var isShowing: Bool = false
    
    func fetchData() {
        
        let url = "http://openapi.seoul.go.kr:8088/5a4e417141676f35363346636d4c6f/json/lostArticleInfo/1/100/%20/\(formattedDate)/"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: LostAndFoundResponse.self) { response in
                switch response.result {
                case .success(let data):
                    let filteredData = data.lostArticleInfo.row.filter { $0.cate == self.selectedCategory }
                    self.lostAndFoundItems = filteredData
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
    
}

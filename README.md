# 🧸Maybe-Toy - 대중교통 분실물 찾기 앱

## 🔨사용기술
- SwiftUI
- Alamofire


## 🔨사용기술 예시코드
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
⬆️ Alamofire 을 통한 네트워킹  

## 🔍앱의 주요기능
- 공공데이터를 이용한 대중교통회사에 등록된 분실물 정보 확인할 수 있습니다.
- 분실날짜, 분실물종류 등을 이용하여 검색할 수 있습니다.
- 분실물 정보에 따른 분실물 보관위치, 보관회사 등 간단한 정보를 확인할 수 있습니다.

## 👨‍💻프로젝트를 계획한 이유
- SwiftUI 의 경험와 Alamofire 를 경험하고자 만들게 되었습니다.
- 공공데이터중 분실물에 대한 정보로 앱을 만들면 사용자들 에게 유용하다고  
생각되어 선택하게 되었습니다.



## 🤓배포과정에서 느낀점
- SwiftUI 를 경험하게 되면서  Single Source of truth 를 이해하였습니다.
- 공공데이터의 양이 많아 선택요청인자를 추가적으로 사용하여 검색범위를 축소시켜  
검색 속도를 높이는 경험을 하였습니다.
- DatePicker에 데이터가 존재하지 않는 년도까지 선택범위가 적용되어있는 문제를 발견하여서  
조건문을 이용하여  날짜를 데이터가 존재하는 2008 년도부터 검색이 가능하도록 구현했습니다.   

//
//  Decoding.swift
//  Maybe
//
//  Created by 시모니 on 1/15/24.
//

import Foundation

struct LostAndFoundResponse: Decodable {
    let lostArticleInfo: LostArticleInfo

    struct LostArticleInfo: Decodable {
        let listTotalCount: Int
        let row: [LostAndFoundItem]

        enum CodingKeys: String, CodingKey {
            case listTotalCount = "list_total_count"
            case row
        }
    }
}

struct LostAndFoundItem: Identifiable, Decodable {
    let id: String
    let status: String
    let regDate: String
    let getDate: String
    let getThing: String
    let takePlace: String
    let takeID: String
    let getName: String
    let cate: String
    let getPosition: String
    let readCnt: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case status = "STATUS"
        case regDate = "REG_DATE"
        case getDate = "GET_DATE"
        case getThing = "GET_THING"
        case takePlace = "TAKE_PLACE"
        case takeID = "TAKE_ID"
        case getName = "GET_NAME"
        case cate = "CATE"
        case getPosition = "GET_POSITION"
        case readCnt = "READ_CNT"
    }
}

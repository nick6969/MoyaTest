//
//  MoyaTestTests.swift
//  MoyaTestTests
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import XCTest
@testable import MoyaTest
import Moya
import CHLMVP

class MoyaTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRightData() {
        let json = [
            ["District": "萬里區", "zipcode": "207"]
        ]

        // 建立假資料
        let customEndpointClosure = { (target: NewTaipeiAPI) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200, json.json!) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }

        // 填入測試用的 Provider
        let stubbingProvider = MoyaProvider<NewTaipeiAPI>(endpointClosure: customEndpointClosure)
        WebService.shared.getZipData(provider: stubbingProvider, success: { models in
            XCTAssert(models.count == 1, "數量錯誤")
            XCTAssert(models.first?.district == "萬里區")
            XCTAssert(models.first?.zipcode == "207")
        }, failure: {_ in
            XCTAssert(false, "not in here")
        })
    }

}

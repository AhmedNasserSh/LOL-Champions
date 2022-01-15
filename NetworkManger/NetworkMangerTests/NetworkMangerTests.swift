//
//  NetworkMangerTests.swift
//  NetworkMangerTests
//
//  Created by Ahmed Naser on 09/01/2022.
//

import XCTest
@testable import NetworkManger

class NetworkMangerTests: XCTestCase {

    var networkClient: NetworkClient?
    
    override func setUpWithError() throws {
        networkClient = NetworkClient()
    }

    override func tearDownWithError() throws {
        networkClient = nil
    }

    func testNetwrokSucccess() async throws {
        let request = Request(url: URL(string: "https://github.com")!)
        let data = try? await networkClient?.makeRequest(request)
        XCTAssertNotNil(data)
    }
    
    func testNetwrokFaliure() async {
        let request = Request(url: URL(string: "https://gb.com")!)
        let data = try? await networkClient?.makeRequest(request)
        XCTAssertNil(data)
    }
}

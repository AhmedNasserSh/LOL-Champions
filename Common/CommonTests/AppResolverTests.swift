//
//  AppResolverTests.swift
//  CommonTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import XCTest
import Swinject
@testable import Common

class TestClass {
    @Inject var mock: MockClass
}

class MockClass {
    
}

class AppResolverTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }

    func testResolvingDependency() {
        let container = Container()
        container.register(MockClass.self) { _ in
            return MockClass()
        }
        AppResolver.shared.setDependencyContainer(container)
        let testClass = TestClass()
        
        XCTAssertNotNil(testClass.mock, "Resolver doesn't work")
    }
}

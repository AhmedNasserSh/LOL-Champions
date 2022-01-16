//
//  ChampionUseCaseTests.swift
//  HomeTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import XCTest
@testable import Home
@testable import Common
@testable import Swinject
@testable import NetworkManger

class ChampionUseCaseTests: XCTestCase {
    var championUseCase: ChampionsUseCase?
    
    override func setUpWithError() throws {
        initDI()
        championUseCase = ChampionsUseCase()
    }

    override func tearDownWithError() throws {
        championUseCase = nil
    }

    func testFetchAndOrder() async throws {
        let data = try await championUseCase?.fetchChampions()
        XCTAssertEqual(data![0].name, "Ahari")
    }

}

extension ChampionUseCaseTests {
    func initDI() {
        let container = Container()
        AppResolver.shared.setDependencyContainer(container)
        NetwrokDIIntilizer(container: container).buildContainer()

        container.register(ChampionsServiceType.self) { _  in
            return ChampionsServiceMock()
        }
        
        container.register(ChampionsRepoType.self) { _  in
            return ChampionRepoMock()
        }
        
    }
}

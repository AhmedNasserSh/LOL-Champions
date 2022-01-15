//
//  ChampionInfoUseCaseTests.swift
//  ChampionDetailsTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import XCTest
@testable import ChampionDetails
@testable import Swinject
@testable import Common
@testable import NetworkManger

class ChampionInfoUseCaseTests: XCTestCase {
    
    var championUseCase: ChampionInfoUseCase?
    
    override func setUpWithError() throws {
        initDI()
        championUseCase = ChampionInfoUseCase()
    }

    override func tearDownWithError() throws {
        championUseCase = nil
    }

    func testFetchSpells() async throws {
        let data = try await championUseCase?.fetchChampionInfo(championName: "")
        XCTAssertEqual(data![0].name, "Magic")
    }

}

extension ChampionInfoUseCaseTests {
    func initDI() {
        let container = Container()
        AppResolver.shared.setDependencyContainer(container)
        container.register(NetworkClientType.self) { _  in
            return NetworkClient()
        }

        container.register(ChampionInfoServiceType.self) { _  in
            return ChampionInfoServiceMock()
        }
        
        container.register(ChampionInfoRepoType.self) { _  in
            return ChampionInfoRepoMock()
        }
        
    }

}

//
//  AppCoordinatorDIIntilizer.swift
//  AppCoordinator
//
//  Created by Ahmed Naser on 16/01/2022.
//

import Foundation
import Swinject

public class AppCoordinatorDIIntilizer {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerCoordinator()
    }

}
// MARK: Coordinator
extension AppCoordinatorDIIntilizer {
    private  func registerCoordinator() {
        container.register(AppCoordinator.self) { _  in
            return AppCoordinator()
        }.inObjectScope(.transient)
        
    }
}

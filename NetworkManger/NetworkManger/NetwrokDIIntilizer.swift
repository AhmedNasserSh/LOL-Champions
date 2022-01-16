//
//  NetwrokDIIntilizer.swift
//  NetworkManger
//
//  Created by Ahmed Naser on 16/01/2022.
//

import Foundation
import Swinject

public class NetwrokDIIntilizer {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerNetworkClient()
    }

}
// MARK: Netwrok Client
extension NetwrokDIIntilizer {
    private  func registerNetworkClient() {
        container.register(NetworkClientType.self) { _  in
            return NetworkClient()
        }.inObjectScope(.transient)
        
    }
}

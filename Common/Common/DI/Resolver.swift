//
//  Resolver.swift
//  Common
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject

public class AppResolver {
    public static let shared = AppResolver()
    private var container: Container!

    public func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    public func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}

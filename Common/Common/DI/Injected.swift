//
//  Injected.swift
//  Common
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation

@propertyWrapper
public struct Inject<Component> {
    public let wrappedValue: Component
    public init() {
        self.wrappedValue = AppResolver.shared.resolve(Component.self)
    }
}

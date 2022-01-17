//
//  NSValueTransformer.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
@objc(NSValueTransformer)
final class NSValueTransformer: NSSecureUnarchiveFromDataTransformer {

    override static var allowedTopLevelClasses: [AnyClass] {
        return [ChampionCacheModel.self]
    }

}

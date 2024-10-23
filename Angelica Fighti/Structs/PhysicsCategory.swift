//
//  Structs.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 12/30/16.
//  Copyright © 2016 Wong. All rights reserved.
//

import Foundation

enum PhysicsCategory {
    static let None      : UInt32 = 0
    static let Player   :UInt32 = 1 << 1
    static let Enemy   : UInt32 = 1 << 2
    static let Projectile : UInt32 = 1 << 3
    static let Currency : UInt32 = 1 << 4
    static let Wall: UInt32 = 1 << 5
    static let Immune       : UInt32 = 1 << 7
}

enum GravityCategory {
    static let None : UInt32 = 0
    static let Player : UInt32 = 1 << 0
}

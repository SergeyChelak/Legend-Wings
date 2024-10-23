//
//  SKSpriteNode+GameObjects.swift
//  Angelica Fighti
//
//  Created by Sergey on 23.10.2024.
//  Copyright © 2024 Wong. All rights reserved.
//

import SpriteKit

struct WallData {
    let name: String
    let edgeFrom: CGPoint
    let to: CGPoint
}

func createWall(_ data: WallData) -> SKSpriteNode {
    let wall = SKSpriteNode()
    wall.name = data.name
    let physicsBody = SKPhysicsBody(edgeFrom: data.edgeFrom, to: data.to)
    physicsBody.isDynamic = false
    physicsBody.categoryBitMask = PhysicsCategory.Wall
    wall.physicsBody = physicsBody
    return wall
}

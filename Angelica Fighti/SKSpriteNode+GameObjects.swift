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

func spawnClouds() -> [SKSpriteNode] {
    (0...3).map { i in
        let cloud = SKSpriteNode()
        if i % 2 == 0 {
            cloud.texture = global.getMainTexture(main: .StartCloud_1)
            cloud.name = Global.Main.StartCloud_1.rawValue + String(i)
        }
        else{
            cloud.texture = global.getMainTexture(main: .StartCloud_2)
            cloud.name = Global.Main.StartCloud_2.rawValue + String(i)
        }
        cloud.size = CGSize(width: screenSize.width, height: screenSize.height*1.5)
        cloud.anchorPoint = CGPoint(x: 0.5, y: 0)
        cloud.position = CGPoint(x: screenSize.width/2, y: screenSize.height)
        cloud.zPosition = -1
        return cloud
    }
}

func runAction(_ action: SKAction, on nodes: SKSpriteNode...) {
    nodes.forEach {
        $0.run(action)
    }
}

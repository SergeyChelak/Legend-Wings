//
//  Projectile.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 6/3/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import Foundation
import SpriteKit

struct Projectile {
    
    private var originX:CGFloat
    private var originY:CGFloat
    private let name = "bullet" // Do not change it.
    private var bulletNode: SKSpriteNode
    private var bulletLevel:Int
    private let bulletMaker = BulletMaker()
    
    init (posX:CGFloat, posY:CGFloat, char:Toon.Character, bulletLevel: Int){
        originX = posX
        originY = posY + 35
        self.bulletLevel = bulletLevel
        bulletNode = bulletMaker.make(level: bulletLevel, char: char)
        
        bulletNode.userData = NSMutableDictionary()
        bulletNode.name = name
        bulletNode.setScale(0.25)
        bulletNode.physicsBody = {
            let physicsBody = SKPhysicsBody(circleOfRadius: 3)
            physicsBody.affectedByGravity = false
            physicsBody.collisionBitMask = 0
            physicsBody.categoryBitMask = PhysicsCategory.Projectile
            physicsBody.fieldBitMask = GravityCategory.None // Not affect by Magnetic Force
            physicsBody.contactTestBitMask = PhysicsCategory.Enemy | PhysicsCategory.Immune
            physicsBody.allowsRotation = false
            physicsBody.velocity = CGVector(dx: 0, dy: 1500)
            return physicsBody
        }()
    }
    
    func shoot() -> SKSpriteNode {
        let bullet = bulletNode.copy() as! SKSpriteNode
        bullet.power = getPowerValue()
        bullet.position = CGPoint(x: originX, y: originY)
        bullet.run(SKAction.scale(to: 1.0, duration: 0.2))
        bullet.run(SKAction.sequence([SKAction.wait(forDuration: 0.38), SKAction.removeFromParent()]))
        return bullet
    }
    
    func generateTouchedEnemyEmitterNode(x posX:CGFloat, y posY:CGFloat) -> SKEmitterNode{
        let effect = SKEmitterNode(fileNamed: "bulling.sks")
        effect!.position = CGPoint(x: posX, y: posY)
        
        effect!.run(SKAction.sequence([SKAction.wait(forDuration: Double(effect!.particleLifetime)), SKAction.removeFromParent()]))
        return effect!
    }
    
    mutating func setPosX(x:CGFloat){
        originX = x
    }
    
    mutating func setPosY(y:CGFloat){
        originY = y + 35
    }
    
    func printPosition(){
        print ("This: ", originX, originY)
    }
    
    func getPowerValue() -> CGFloat{
        return 25 + 5.0*CGFloat(bulletLevel)
    }
    func getBulletLevel() -> Int{
        return bulletLevel
    }
    
    mutating func setBulletLevel(level: Int){
        self.bulletLevel = level
    }
    
    mutating func upgrade() -> Bool{
        if bulletLevel >= 50 {
            return false
        }
        self.bulletLevel += 1
        return true
    }
    
}

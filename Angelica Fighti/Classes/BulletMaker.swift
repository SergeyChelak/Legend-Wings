//
//  BulletMaker.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 7/4/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import SpriteKit

class BulletMaker:NSObject{
    
    deinit{
        print("bullet maker deinit")
    }
    enum BulletType {
        case Type_1
        case Type_2
        case Type_3
        case Type_4
        case Type_5
        
    }

    private func addBullet(sprite:(SKTexture, CGSize), dx: CGFloat, dy: CGFloat, zPos:CGFloat) -> SKSpriteNode{
        let node = SKSpriteNode(texture: sprite.0)
        node.size.height = sprite.1.height * 0.7
        node.size.width = sprite.1.width * 0.7
        node.position.x = node.size.width*dx
        node.position.y = node.size.height*dy
        node.zPosition = zPos
        node.alpha = 1.0
        
        return node
    }
    
    private func getBulletType(charType: Toon.Character, type:BulletType) -> (SKTexture, CGSize){
        
        switch charType {
        case .Alpha:
            switch type {
            case .Type_1:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_1)
                let w = screenSize.width * 0.036
                let h = screenSize.height * 0.034
                return (sprite, CGSize(width: w, height: h))
            case .Type_2:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_2)
                let w = screenSize.width * 0.051
                let h = screenSize.height * 0.06
                return (sprite, CGSize(width: w, height: h))
            case .Type_3:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_3)
                let w = screenSize.width * 0.0845
                let h = screenSize.height * 0.064
                return (sprite, CGSize(width: w, height: h))
            case .Type_4:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_4)
                let w = screenSize.width * 0.111
                let h = screenSize.height * 0.079
                return (sprite, CGSize(width: w, height: h))
            case .Type_5:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_5)
                let w = screenSize.width * 0.152
                let h = screenSize.height * 0.1
                return (sprite, CGSize(width: w, height: h))
            }
        case .Beta:
            switch type {
            case .Type_1:
                let sprite = global.getMainTexture(main: .Character_Beta_Projectile_1)
                let w = screenSize.width * 0.041
                let h = screenSize.height * 0.033
                return (sprite, CGSize(width: w, height: h))
            case .Type_2:
                let sprite = global.getMainTexture(main: .Character_Beta_Projectile_2)
                let w = screenSize.width * 0.104
                let h = screenSize.height * 0.083
                return (sprite, CGSize(width: w, height: h))
            case .Type_3:
                let sprite = global.getMainTexture(main: .Character_Beta_Projectile_3)
                let w = screenSize.width * 0.109
                let h = screenSize.height * 0.065
                return (sprite, CGSize(width: w, height: h))
            case .Type_4:
                let sprite = global.getMainTexture(main: .Character_Beta_Projectile_4)
                let w = screenSize.width * 0.157
                let h = screenSize.height * 0.096
                return (sprite, CGSize(width: w, height: h))
            case .Type_5:
                let sprite = global.getMainTexture(main: .Character_Beta_Projectile_5)
                let w = screenSize.width * 0.157
                let h = screenSize.height * 0.1
                return (sprite, CGSize(width: w, height: h))
            }
        case .Celta:
            switch type {
            case .Type_1:
                let sprite = global.getMainTexture(main: .Character_Celta_Projectile_1)
                let w = screenSize.width * 0.039
                let h = screenSize.height * 0.0285
                return (sprite, CGSize(width: w, height: h))
            case .Type_2:
                let sprite = global.getMainTexture(main: .Character_Celta_Projectile_2)
                let w = screenSize.width * 0.111
                let h = screenSize.height * 0.0625
                return (sprite, CGSize(width: w, height: h))
            case .Type_3:
                let sprite = global.getMainTexture(main: .Character_Celta_Projectile_3)
                let w = screenSize.width * 0.08
                let h = screenSize.height * 0.077
                return (sprite, CGSize(width: w, height: h))
            case .Type_4:
                let sprite = global.getMainTexture(main: .Character_Celta_Projectile_4)
                let w = screenSize.width * 0.157
                let h = screenSize.height * 0.076
                return (sprite, CGSize(width: w, height: h))
            case .Type_5:
                let sprite = global.getMainTexture(main: .Character_Celta_Projectile_5)
                let w = screenSize.width * 0.138
                let h = screenSize.height * 0.098
                return (sprite, CGSize(width: w, height: h))
            }
        case .Delta:
            switch type {
            case .Type_1:
                let sprite = global.getMainTexture(main: .Character_Delta_Projectile_1)
                let w = screenSize.width * 0.036
                let h = screenSize.height * 0.035
                return (sprite, CGSize(width: w, height: h))
            case .Type_2:
                let sprite = global.getMainTexture(main: .Character_Delta_Projectile_2)
                let w = screenSize.width * 0.075
                let h = screenSize.height * 0.0475
                return (sprite, CGSize(width: w, height: h))
            case .Type_3:
                let sprite = global.getMainTexture(main: .Character_Delta_Projectile_3)
                let w = screenSize.width * 0.0845
                let h = screenSize.height * 0.068
                return (sprite, CGSize(width: w, height: h))
            case .Type_4:
                let sprite = global.getMainTexture(main: .Character_Delta_Projectile_4)
                let w = screenSize.width * 0.094
                let h = screenSize.height * 0.065
                return (sprite, CGSize(width: w, height: h))
            case .Type_5:
                let sprite = global.getMainTexture(main: .Character_Delta_Projectile_5)
                let w = screenSize.width * 0.125
                let h = screenSize.height * 0.068
                return (sprite, CGSize(width: w, height: h))
            }
        default:
            print("Should not reach here - BulletMaker Default Choice")
            switch type {
            case .Type_1:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_1)
                let w = screenSize.width * 0.036
                let h = screenSize.height * 0.034
                return (sprite, CGSize(width: w, height: h))
            case .Type_2:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_2)
                let w = screenSize.width * 0.051
                let h = screenSize.height * 0.06
                return (sprite, CGSize(width: w, height: h))
            case .Type_3:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_3)
                let w = screenSize.width * 0.0845
                let h = screenSize.height * 0.064
                return (sprite, CGSize(width: w, height: h))
            case .Type_4:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_4)
                let w = screenSize.width * 0.111
                let h = screenSize.height * 0.079
                return (sprite, CGSize(width: w, height: h))
            case .Type_5:
                let sprite = global.getMainTexture(main: .Character_Alpha_Projectile_5)
                let w = screenSize.width * 0.152
                let h = screenSize.height * 0.1
                return (sprite, CGSize(width: w, height: h))
            }
        }
    }
    
    internal func make(level: Int, char:Toon.Character) -> SKSpriteNode{
        let node = SKSpriteNode()
        
        let s1 = getBulletType(charType: char, type: .Type_1)
        let s2 = getBulletType(charType: char, type: .Type_2)
        let s3 = getBulletType(charType: char, type: .Type_3)
        let s4 = getBulletType(charType: char, type: .Type_4)
        let s5 = getBulletType(charType: char, type: .Type_5)
        
        node.name = "mainNode"
        
        switch level {
        case 1:
            node.addChild(addBullet(sprite: s1, dx: 0, dy: 1/2, zPos: 1))
        case 2:
            node.addChild(addBullet(sprite: s1, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1/2, dy: 1/2, zPos: 2))
        case 3:
            node.addChild(addBullet(sprite: s1, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1, dy: 0, zPos: 2))
        case 4:
            node.addChild(addBullet(sprite: s1, dx: -1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: 1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 2))
        case 5:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
        case 6:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1, dy: 0, zPos: 2))
        case 7:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -2, dy: -1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 2, dy: -1/2, zPos: 2))
        case 8:
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 1))
        case 9:
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 2))
        case 10:
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -1/2, zPos: 3))
        case 11:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.75, dy: 0, zPos: 2))
        case 12:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -2, dy: -1, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 2, dy: -1, zPos: 3))
        case 13:
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -2, dy: -1, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 2, dy: -1, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -0.75, zPos: 4))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -0.75, zPos: 4))
        case 14:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
        case 15:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.25, dy: 0, zPos: 2))
        case 16:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -1/2, zPos: 3))
        case 17:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.75, dy: 0, zPos: 2))
        case 18:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: -0.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: 0.5, dy: -1/2, zPos: 3))
        case 19:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -2.0, dy: -1, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 2.0, dy: -1, zPos: 3))
        case 20:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -0.5, dy: 0.25, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.5, dy: 0.25, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.0, dy: -0.25, zPos: 3))
        case 21:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
        case 22:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.75, dy: 0, zPos: 2))
        case 23:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.75, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -0.5, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -0.5, zPos: 3))
        case 24:
            node.addChild(addBullet(sprite: s3, dx: -1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 1/2, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 0, zPos: 2))
        case 25:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1.25, dy: 0, zPos: 2))
        case 26:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -1/2, zPos: 2))
        case 27:
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: -0.25, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: 0.25, dy: -1/2, zPos: 3))
        case 28:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.5, dy: 0, zPos: 2))
        case 29:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -0.5, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -0.5, zPos: 3))
        case 30:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -0.5, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -0.5, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: -0.25, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: -0.25, zPos: 3))
        case 31:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: -0.25, zPos: 3))
        case 32:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: -0.25, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -1, dy: 0.0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1, dy: 0.0, zPos: 3))
        case 33:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: -0.25, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -1, dy: 0.0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1, dy: 0.0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -0.75, dy: -0.25, zPos: 4))
            node.addChild(addBullet(sprite: s1, dx: 0.75, dy: -0.25, zPos: 4))
        case 34:
            node.addChild(addBullet(sprite: s3, dx: 0, dy: 1/2, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0, dy: -0.25, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: -1, dy: 0.0, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: 1, dy: 0.0, zPos: 3))
        case 35:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
        case 36:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1/2, dy: 1/2, zPos: 2))
        //node.addChild(make(level: 2, char: char))
        case 37:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s1, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 3))
        case 38:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 2))
        case 39:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 3))
        case 40:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -0.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 0.5, dy: -1/2, zPos: 3))
        case 41:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s2, dx: -1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1/2, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: -1.25, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: 1.25, dy: 0, zPos: 3))
        case 42:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
        case 43:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 3))
        case 44:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s1, dx: 1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -1.5, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: 2.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s1, dx: -2.5, dy: -1/2, zPos: 3))
        case 45:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 1.0, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: -1.0, dy: 0, zPos: 3))
        case 46:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.0, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: -0.5, dy: 0, zPos: 2))
            node.addChild(addBullet(sprite: s2, dx: 0.5, dy: -1/2, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: -0.5, dy: -1/2, zPos: 3))
        case 47:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.75, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s3, dx: -0.75, dy: 0, zPos: 3))
        case 48:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.75, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s3, dx: -0.75, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s2, dx: 0.5, dy: -1/2, zPos: 4))
            node.addChild(addBullet(sprite: s2, dx: -0.5, dy: -1/2, zPos: 4))
        case 49:
            node.addChild(addBullet(sprite: s4, dx: 0, dy: 0, zPos: 1))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: 1/2, zPos: 2))
            node.addChild(addBullet(sprite: s3, dx: 0.75, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s3, dx: -0.75, dy: 0, zPos: 3))
            node.addChild(addBullet(sprite: s3, dx: 0.25, dy: -1/2, zPos: 4))
            node.addChild(addBullet(sprite: s3, dx: -0.25, dy: -1/2, zPos: 4))
        case 50:
            node.addChild(addBullet(sprite: s5, dx: 0, dy: 0, zPos: 1))
        default:
            print("unexpected level \(level)")
            break
        }
        return node
    }
}
    

//
//  Currency.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 6/3/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import SpriteKit
import AVFoundation

struct Currency{
    
    enum CurrencyType{
        
        case Coin
        case RedJewel
        case WhiteJewel
        case None
        
    }
    
    private var actions:[SKTexture]
    var audioPlayer:AVAudioPlayer?
    
    init(type: CurrencyType, avaudio: AVAudio? = nil){
        
        
        switch type{
        case .Coin:
            actions = global.getTextures(textures: .Gold_Animation)
        default:
            actions = []
        }
        
    }
    
    func createCoin(posX:CGFloat, posY:CGFloat, width w: CGFloat, height h: CGFloat, createPhysicalBody:Bool, animation: Bool) -> SKSpriteNode {
        // let c = SKSpriteNode(imageNamed: coinSpriteName!)
        let c = SKSpriteNode(texture: global.getMainTexture(main: .Gold))
        //c.size = CGSize(width: 30, height: 30)
        c.size = CGSize(width: w, height: h)
        c.position = CGPoint(x: posX, y: posY)
        c.name = "coin"
        
        if (createPhysicalBody) {
            let physicsBody = SKPhysicsBody(circleOfRadius: 15)
            physicsBody.isDynamic = true // allow physic simulation to move it
            physicsBody.categoryBitMask = PhysicsCategory.Currency
            physicsBody.contactTestBitMask = PhysicsCategory.Player
            physicsBody.collisionBitMask = PhysicsCategory.Wall
            physicsBody.fieldBitMask = GravityCategory.Player // Pullable by player
            
            c.physicsBody = physicsBody
        }
        
        if (animation){
            c.run(SKAction.repeatForever(SKAction.animate(with: actions, timePerFrame: 0.1)))
        }
        return c
        
    }
    
}

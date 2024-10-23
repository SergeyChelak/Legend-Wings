//
//  Enemy.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 12/31/16.
//  Copyright © 2016 Wong. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit

class EnemyModel {
    
    deinit{
        print("EnemyModel Class Deinitiated")
    }
    
    enum EnemyType: String {
        case boss = "Boss Type"
        case regular = "Regular Type"
        case fireball = "Fireball Type"
        case special = "Special Type"
    }
    
    enum BossType {
        case none
        case pinky
        case bomber
    }
    
    // Shared Variables
    private var enemyType: EnemyType
    private var enemyModel = SKSpriteNode()
    private var currency = Currency(type: .Coin)
    private var bossType: BossType = .none
    private var bossBaseHP :CGFloat = 1500.0
    private var regularBaseHP: CGFloat = 100.0
    
    
    private var velocity = CGVector(dx: 0, dy: -350)
    
    
    // Boss Variables - Implement later
    private let PinkyPercentage:Int = 100
    private let BomberPercentage:Int = 0
    
    weak var delegate: GameInfoDelegate?
    
    init(type: EnemyType){
        enemyType = type
    }
    
    internal func spawn(scene: SKScene){
        
        switch enemyType {
        case .regular:
            enemyModel = RegularEnemy(baseHp: regularBaseHP, speed: velocity)
        case .boss:
            let chance = randomInt(min: 0, max: 100)
                if chance < 50{
                    bossType = .bomber
                    enemyModel = Bomber(hp: bossBaseHP)
                }
                else{
                    bossType = .pinky
                    enemyModel = Pinky(hp: bossBaseHP, lives: 2, isClone: false)
                }
            
        case .fireball:
            guard let node = delegate?.getCurrentToonNode() else {
                print("ERR1000: delegate wasn't set")
                return
            }
            enemyModel = Fireball(target: node, speed: velocity)
        default:
            break
        }
        
        scene.addChild(enemyModel)
    }
    
    internal func increaseDifficulty(){
        // Increase HP & Speed
        switch enemyType {
        case .regular:
            regularBaseHP += 100
            velocity.dy -= 50
        case .boss:
            bossBaseHP += 1500
        case .fireball:
            velocity.dy -= 250
        default:
            print("No increase for \(enemyType.rawValue)")
        }
    }
    
    internal func decreaseHP(ofTarget: SKSpriteNode, hitBy: SKSpriteNode) {
        guard let rootBar = ofTarget.childNode(withName: "rootBar") as? SKSpriteNode,
              let enemyHpBar = rootBar.childNode(withName: "hpBar") else {
            return
        }
        guard let ofTarget = ofTarget as? Enemy else{
            return
        }
        
        ofTarget.hp = ofTarget.hp - hitBy.power
        
        if (hitBy.name == "bullet"){
            let percentage = ofTarget.hp > 0.0 ? ofTarget.hp/ofTarget.maxHp : 0.0
            let originalBarSize = rootBar.size.width
                enemyHpBar.run(SKAction.resize(toWidth: originalBarSize * percentage, duration: 0.03))
                update(sknode: ofTarget, hpBar: enemyHpBar)
            if (ofTarget.hp <= 0){
                ofTarget.physicsBody?.categoryBitMask = PhysicsCategory.None
                enemyHpBar.removeFromParent()
                explode(node: ofTarget)
                return
            }
            else{
                if enemyHpBar.isHidden {
                    enemyHpBar.isHidden = false
                }
            }
        }
        
    }
    
    internal func update(sknode: SKSpriteNode, hpBar: SKNode){
        guard let sknode = sknode as? Enemy else{
            return
        }
        
        let percentage = sknode.hp/sknode.maxHp
        if percentage < 0.3 {
                hpBar.run(SKAction.colorize(with: .red, colorBlendFactor: 1, duration: 0.1))
            }
        else if (percentage < 0.55){
                hpBar.run(SKAction.colorize(with: .yellow, colorBlendFactor: 1, duration: 0.1))
            }
    }
    
    internal func explode(node: SKSpriteNode){
        let rewardCount:Int = randomInt(min: 1, max: 4)
        
        var posX = node.position.x
        var posY = node.position.y
        
        if self.enemyType == .regular{
            // converting to position in scene's view... required because its parent is not the root view
            posX = node.position.x + screenSize.width/2
            posY = node.parent!.frame.size.height/2 + 200 + node.position.y  + screenSize.height
        }
        
        for _ in 0..<rewardCount {
            let reward = currency.createCoin(posX: posX, posY: posY, width: 30, height: 30, createPhysicalBody: true, animation: true)
            let impulse = CGVector(dx: random(min: -25, max: 25), dy: random(min:10, max:35))
            reward.run(SKAction.sequence([
                SKAction.applyForce(impulse , duration: 0.2),
                SKAction.wait(forDuration: 2), SKAction.removeFromParent()
            ]))
            delegate?.addChild(reward)
        }

        node.removeAllActions()
        
        switch (enemyType){
        case .boss:
            if bossType == .bomber{
                
                let mainBoss = enemyModel as! Bomber
                mainBoss.defeated()
                self.delegate?.changeGameState(.waitingState)
            }
            else if bossType == .pinky{
                let minion = node.parent! as! Pinky
                minion.multiply()
                
                let mainBoss = enemyModel as! Pinky
                print("calling is defeated....")
                if mainBoss.isDefeated(){
                    self.delegate?.changeGameState(.waitingState)
                }
            }
            
        case .regular:
            let mainReg = enemyModel as! RegularEnemy
            mainReg.defeated(sknode: node)
            node.run((delegate?.mainAudio.getAction(type: .Puff))!)
        default:
            node.removeFromParent()
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

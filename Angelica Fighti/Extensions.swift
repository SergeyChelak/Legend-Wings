//
//  Extensions.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 12/30/16.
//  Copyright © 2016 Wong. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit
import UIKit

protocol ProjectileDelegate {
    func add(sknode: SKNode)
}

enum GameState{
    case spawning  // state which waves are incoming
    case bossEncounter // boss encounter
    case waitingState // Need an state
    case noState
    case start
}

enum ContactType{
    case HitByEnemy
    case EnemyGotHit
    case PlayerGetCoin
    case Immune
    case None
}

// MARK: SKNode
fileprivate let userDataKeyPower = "power"

extension SKNode {
    var power: CGFloat {
        get {
            guard let v = userData?.value(forKey: userDataKeyPower) as? CGFloat else {
                print ("Extension SKNode Error for POWER Variable: ",  userData?.value(forKey: userDataKeyPower) ?? -1.0 )
                return -9999.0
            }
            return v
        }
        set(newValue) {
            userData?.setValue(newValue, forKey: userDataKeyPower)
        }
    }
    
    func run(action: SKAction, optionalCompletion: (() -> Void)?){
        guard let completion = optionalCompletion else {
            run(action)
            return
        }
        run(SKAction.sequence([action, SKAction.run(completion)]))
    }
    
    func addChildren(_ nodes: SKNode...) {
        nodes.forEach(addChild(_:))
    }
}

// MARK:
extension SKLabelNode {
    func shadowNode(nodeName:String) -> SKEffectNode{
        let myShader = SKShader(fileNamed: "gradientMonoTone")
        let effectNode = SKEffectNode()
        effectNode.shader = myShader
        effectNode.shouldEnableEffects = true
        effectNode.addChild(self)
        effectNode.name = nodeName
        return effectNode
    }
}

// MARK: RANDOM FUNCTIONS
func random() -> CGFloat {
    CGFloat(Float(arc4random()) / Float(UInt32.max))
}

func random( min: CGFloat, max: CGFloat) -> CGFloat {
    random() * (max - min) + min
}

func randomInt( min: Int, max: Int) -> Int{
    //return randomInt() * (max - min ) + min
    Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

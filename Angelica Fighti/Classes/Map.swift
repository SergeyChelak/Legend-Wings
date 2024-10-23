//
//  Map.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 6/3/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import Foundation
import SpriteKit

class Map: NSObject{
    
    deinit {
        timer?.invalidate()
        print("Map has been deinitialized")
    }
    
    private var timer: Timer?
    
    private var mapTextures: [SKTexture]
    private var bottomTexture: SKTexture
    private var midTexture: SKTexture
    private var topTexture: SKTexture
    private var currentIndex: Int
    
    
    let top:SKSpriteNode
    let mid:SKSpriteNode
    let bottom:SKSpriteNode
    
    init(maps: [SKTexture], scene: SKScene){
        
        if maps.count < 3{
            fatalError("maps should have at least 3 textures.")
        }
        
        currentIndex = randomInt(min: 0, max: maps.count - 3)
        mapTextures = maps
        bottomTexture = mapTextures[currentIndex]
        midTexture = mapTextures[currentIndex + 1]
        topTexture = mapTextures[currentIndex + 2]
        currentIndex = currentIndex + 2
        
        // CGSize(width: screenSize.width, height: screenSize.height)
        let tsize = CGSize(width: screenSize.width, height: screenSize.width)
        
        mid = SKSpriteNode()
        mid.texture = midTexture
        mid.size = tsize
        mid.anchorPoint = CGPoint(x: 0.5, y: 0)
        mid.position = CGPoint(x: screenSize.width/2, y: mid.size.height/2)
        mid.zPosition = -5
        
        bottom = SKSpriteNode()
        bottom.texture = bottomTexture
        bottom.size = tsize
        bottom.anchorPoint = CGPoint(x: 0.5, y: 0)
        bottom.position = CGPoint(x: screenSize.width/2, y: mid.position.y - mid.size.height)
        bottom.zPosition = -5
        
        top = SKSpriteNode()
        top.texture = topTexture
        top.size = tsize
        top.anchorPoint = CGPoint(x: 0.5, y: 0)
        top.position = CGPoint(x: screenSize.width/2, y: mid.position.y + mid.size.height)
        top.zPosition = -5
        // create function to start action for moving map
        
        (top.alpha, bottom.alpha, mid.alpha) = (0.0, 0.0, 0.0)
        
        scene.addChildren([mid, bottom, top])
    }
    
    private func getNextTexture() -> SKTexture {
        currentIndex = (currentIndex + 1) % mapTextures.count
        return mapTextures[currentIndex]
    }
    
    func run() {
        // Timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);
        
        // fade in
        let fin = SKAction.fadeAlpha(to: 1, duration: 0.5)
        runAction(fin, on: [top, mid, bottom])
        
        // Action
        let moveDown = SKAction.moveBy(x: 0, y: -2, duration: 0.01)
        runAction(SKAction.repeatForever(moveDown), on: [mid, bottom, top])
    }
    
     @objc func update() {
        if bottom.position.y <= -bottom.size.height {
            bottom.texture = getNextTexture()
            bottom.position.y = top.position.y + top.size.height
        }
        else if top.position.y <= -top.size.height{
            top.texture = getNextTexture()
            top.position.y = mid.position.y + mid.size.height
        }
        else if mid.position.y <= -mid.size.height{
            mid.texture = getNextTexture()
            mid.position.y = bottom.position.y + bottom.size.height
        }
    }
   
    func prepareToChangeScene() {
        timer?.invalidate()
    }
}

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
    private var currentIndex: Int
        
    let top: SKSpriteNode
    let mid: SKSpriteNode
    let bottom: SKSpriteNode
    
    init(maps: [SKTexture], scene: SKScene){
        
        if maps.count < 3 {
            fatalError("maps should have at least 3 textures.")
        }

        mapTextures = maps
        let bottomTexture = mapTextures[0]
        let midTexture = mapTextures[1]
        let topTexture = mapTextures[2]
        currentIndex = 2
        
        let edge = 1.1 * max(screenSize.width, screenSize.height / 3.0)
        let textureSize = CGSize(width: edge, height: edge)
        
        let createNode: (SKTexture) -> SKSpriteNode = { texture in
            let node = SKSpriteNode()
            node.texture = texture
            node.size = textureSize
            node.anchorPoint = CGPoint(x: 0.5, y: 0)
            node.zPosition = -5
            node.alpha = 0.0
            return node
        }
                        
        mid = createNode(midTexture)
        mid.position = CGPoint(x: screenSize.width/2, y: mid.size.height/2)
        
        bottom = createNode(bottomTexture)
        bottom.position = CGPoint(x: screenSize.width/2, y: mid.position.y - mid.size.height)
        
        top = createNode(topTexture)
        top.position = CGPoint(x: screenSize.width/2, y: mid.position.y + mid.size.height)
        
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

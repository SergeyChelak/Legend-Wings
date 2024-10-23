//
//  HUD.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 5/16/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import Foundation
import SpriteKit

struct HUD {
    enum TextType {
        case Gold
        case Trophy
    }
    
    var root:SKSpriteNode
    private var width:CGFloat
    private var height:CGFloat
    private var pos:CGPoint
   // private var anchorPoint:CGPoint
    private var textType: TextType
    private var validChars = (0..<10).map { Character(String($0)) }
    
    init(width w:CGFloat, height h:CGFloat, position p:CGPoint, type:TextType){
        root = SKSpriteNode()
        width = w*0.9
        height = h*0.9
        pos = p
      //  anchorPoint = acp
        textType = type
        validChars.append(Character(String(",")))
    }
    
    mutating func getNode(text:String) -> SKSpriteNode?{
        if !isValidString(text){
            return nil
        }
        
        let node = root
       // let node = SKSpriteNode()
    //    node.anchorPoint = self.anchorPoint
        node.size = CGSize(width: width, height: height)
        node.position = pos
        node.name = "hud"
       // node.color = UIColor.red
       // node.color = UIColor.black
        let textures = getTextures(text)
        
        var xTrack: CGFloat = 0.0
        for t in textures {
            let hudTexture = SKSpriteNode()
            hudTexture.texture = t
            hudTexture.size = t.size()
            let tw = hudTexture.size.width
            let th = hudTexture.size.height
            hudTexture.position = CGPoint(x: width/2 - tw*0.5 - xTrack, y: height/2 - th)
            node.addChild(hudTexture)
            xTrack += tw*0.8
        }
        
        return node
    }
    
    private func isValidString(_ str:String) -> Bool {
        str.allSatisfy {
            validChars.contains($0)
        }
    }
    
    private func getTextures(_ text:String) -> [SKTexture]{
        var pack:[SKTexture] = []
        for c in text.reversed() {
            pack.append(global.getHUDTexture(hudType: .Gold, text: String(c)))
        }
        return pack
    }
}

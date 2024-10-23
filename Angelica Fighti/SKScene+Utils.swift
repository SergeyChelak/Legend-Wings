//
//  SKScene+Utils.swift
//  Angelica Fighti
//
//  Created by Sergey on 23.10.2024.
//  Copyright © 2024 Wong. All rights reserved.
//

import SpriteKit

extension SKScene {
    func removeUIViews() {
        view?.subviews
            .forEach {
                $0.removeFromSuperview()
            }
    }
    
    func recursiveRemovingSKActions(sknodes: [SKNode]) {
        for childNode in sknodes{
            childNode.removeAllActions()
            if childNode.children.count > 0 {
                recursiveRemovingSKActions(sknodes: childNode.children)
            }
            
        }
    }
    
    func removeChild(withName name: String) {
        childNode(withName: name)?.removeFromParent()
    }
    
    func removeChildren(_ names: String...) {
        names.forEach(removeChild(withName:))
    }    
}

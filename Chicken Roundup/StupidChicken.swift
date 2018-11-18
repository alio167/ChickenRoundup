//
//  StupidChicken.swift
//  Chicken Roundup
//
//  Created by clinic18 on 11/17/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import UIKit
import SpriteKit

class StupidChicken: SKSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: "Stupid Chicken")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "stupid chicken"
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.friction = 0.5
        self.physicsBody?.restitution = 0.5
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.angularDamping = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

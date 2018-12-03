//
//  BasicChicken.swift
//  Chicken Roundup
//
//  Created by clinic18 on 11/17/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import UIKit
import SpriteKit

class TouchableObject: SKSpriteNode {
    var id: Int!
    
    init(texture: SKTexture, name: String, id: Int) {
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = name
        self.id = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

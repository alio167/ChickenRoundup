//
//  Chicken.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit
import SpriteKit

class Chicken: SKSpriteNode {
  enum ChickenType: String {
    case basic = "Basic Chicken"
    case stupid = "Stupid Chicken"
  }
    
  let type: ChickenType
  let id: Int

  init(type: ChickenType, id: Int) {
    self.type = type
    self.id = id

    let texture = SKTexture(imageNamed: type.rawValue)
    let size = CGSize(width: 70, height: 100)
    super.init(texture: texture, color: UIColor.clear, size: size)
    
    self.physicsBody?.isDynamic = true
    self.physicsBody?.allowsRotation = false
    self.physicsBody?.friction = 0.5
    self.name = "\(type) \(id)"
  }
    
  required init?(coder aDecoder: NSCoder) {
    self.type = .basic
    self.id = -1
  
    super.init(coder: aDecoder)
  }
  
  
}
